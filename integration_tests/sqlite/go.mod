module github.com/TheBlackHowling/typedb/integration_tests/sqlite

go 1.24.0

require (
	github.com/TheBlackHowling/typedb v1.0.12
	github.com/TheBlackHowling/typedb/integration_tests/testhelpers v0.0.0
	github.com/golang-migrate/migrate/v4 v4.19.1
	github.com/mattn/go-sqlite3 v1.14.33
)

replace github.com/TheBlackHowling/typedb/integration_tests/testhelpers => ../testhelpers
