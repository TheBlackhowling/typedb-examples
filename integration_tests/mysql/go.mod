module github.com/TheBlackHowling/typedb/integration_tests/mysql

go 1.24.0

require (
	github.com/TheBlackHowling/typedb v1.0.12
	github.com/TheBlackHowling/typedb/integration_tests/testhelpers v0.0.0
	github.com/go-sql-driver/mysql v1.9.3
)

require filippo.io/edwards25519 v1.1.0 // indirect

replace github.com/TheBlackHowling/typedb/integration_tests/testhelpers => ../testhelpers
