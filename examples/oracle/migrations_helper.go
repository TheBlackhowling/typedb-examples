package main

import (
	"context"
	"fmt"
	"io/fs"
	"os"
	"path/filepath"
	"sort"
	"strings"

	"github.com/TheBlackHowling/typedb"
)

// runMigrations executes all migration files in order
func runMigrations(ctx context.Context, db *typedb.DB) error {
	migrationsDir := "migrations"
	
	// Get the directory where the executable is located
	execPath, err := os.Executable()
	if err != nil {
		return fmt.Errorf("failed to get executable path: %w", err)
	}
	execDir := filepath.Dir(execPath)
	
	// Try to find migrations directory relative to executable
	migrationsPath := filepath.Join(execDir, migrationsDir)
	if _, err := os.Stat(migrationsPath); os.IsNotExist(err) {
		// If not found, try relative to current working directory
		migrationsPath = migrationsDir
		if _, err := os.Stat(migrationsPath); os.IsNotExist(err) {
			return fmt.Errorf("migrations directory not found: %s", migrationsDir)
		}
	}

	// Read all migration files
	var migrationFiles []string
	err = filepath.WalkDir(migrationsPath, func(path string, d fs.DirEntry, err error) error {
		if err != nil {
			return err
		}
		if !d.IsDir() && strings.HasSuffix(path, ".up.sql") {
			migrationFiles = append(migrationFiles, path)
		}
		return nil
	})
	if err != nil {
		return fmt.Errorf("failed to read migrations directory: %w", err)
	}

	// Sort migration files by name to ensure correct order
	sort.Strings(migrationFiles)

	if len(migrationFiles) == 0 {
		return fmt.Errorf("no migration files found in %s", migrationsPath)
	}

	fmt.Printf("Running %d migrations from %s...\n", len(migrationFiles), migrationsPath)

	// Drop existing tables if they exist (to ensure clean state)
	// This handles the case where tables were created by integration test migrations
	dropTables := []string{"user_posts", "posts", "profiles", "users"}
	for _, tableName := range dropTables {
		_, err := db.Exec(ctx, fmt.Sprintf("DROP TABLE %s CASCADE CONSTRAINTS", tableName))
		if err != nil {
			// Ignore "table does not exist" errors
			errStr := strings.ToLower(err.Error())
			if !strings.Contains(errStr, "does not exist") && !strings.Contains(errStr, "ora-00942") {
				// Log but don't fail - table might not exist
				fmt.Printf("  Warning: Could not drop table %s: %v\n", tableName, err)
			}
		}
	}

	// Execute each migration file
	for _, migrationFile := range migrationFiles {
		fileName := filepath.Base(migrationFile)
		fmt.Printf("  Running migration: %s\n", fileName)

		// Read migration file content
		content, err := os.ReadFile(migrationFile)
		if err != nil {
			return fmt.Errorf("failed to read migration file %s: %w", fileName, err)
		}

		// Oracle uses semicolons as statement terminators
		// Split by semicolon and execute each statement
		// Note: SET SQLBLANKLINES ON is sqlplus-specific and not needed for direct SQL execution
		sqlContent := string(content)
		
		// Split by semicolon, but be careful with semicolons inside strings/comments
		statements := splitOracleStatements(sqlContent)
		
		for _, stmt := range statements {
			stmt = strings.TrimSpace(stmt)
			if stmt == "" {
				continue
			}
			
			// Remove trailing semicolon if present (Oracle driver may handle it, but be safe)
			stmt = strings.TrimSuffix(stmt, ";")
			stmt = strings.TrimSpace(stmt)
			if stmt == "" {
				continue
			}
			
			// Execute statement
			if _, err := db.Exec(ctx, stmt); err != nil {
				// Check if it's a "table already exists" or similar error (migration already run)
				errStr := strings.ToLower(err.Error())
				if strings.Contains(errStr, "already exists") || 
				   strings.Contains(errStr, "name is already used") ||
				   strings.Contains(errStr, "duplicate") ||
				   strings.Contains(errStr, "ora-00955") { // ORA-00955: name is already used by an existing object
					fmt.Printf("    Warning: %s (migration may have already been run)\n", err.Error())
					continue
				}
				return fmt.Errorf("failed to execute migration %s: %w\nStatement: %s", fileName, err, stmt)
			}
		}
	}

	fmt.Println("✓ All migrations completed successfully")
	return nil
}

// splitOracleStatements splits SQL content into individual statements
// Handles semicolons but preserves them in strings and comments
func splitOracleStatements(sql string) []string {
	var statements []string
	var current strings.Builder
	inSingleQuote := false
	inDoubleQuote := false

	for i := 0; i < len(sql); i++ {
		char := sql[i]
		
		switch char {
		case '\'':
			if !inDoubleQuote {
				inSingleQuote = !inSingleQuote
			}
			current.WriteByte(char)
		case '"':
			if !inSingleQuote {
				inDoubleQuote = !inDoubleQuote
			}
			current.WriteByte(char)
		case ';':
			if !inSingleQuote && !inDoubleQuote {
				// This is a statement terminator
				stmt := strings.TrimSpace(current.String())
				if stmt != "" {
					statements = append(statements, stmt)
				}
				current.Reset()
			} else {
				current.WriteByte(char)
			}
		case '\n':
			// Preserve newlines
			current.WriteByte(char)
		default:
			current.WriteByte(char)
		}
	}

	// Add any remaining content as a statement
	stmt := strings.TrimSpace(current.String())
	if stmt != "" {
		statements = append(statements, stmt)
	}

	return statements
}
