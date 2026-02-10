-- Table for testing partial update zero-value behavior (string, bool, int, float)
CREATE TABLE IF NOT EXISTS zero_value_test (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    str_col TEXT NOT NULL DEFAULT '',
    bool_col INTEGER NOT NULL DEFAULT 1,
    int_col INTEGER NOT NULL DEFAULT 0,
    float_col REAL NOT NULL DEFAULT 0.0
);
