module github.com/TheBlackHowling/typedb/integration_tests/mysql

go 1.23

require (
	github.com/TheBlackHowling/typedb v1.0.11
	github.com/TheBlackHowling/typedb/integration_tests/testhelpers v0.0.0
	github.com/golang-migrate/migrate/v4 v4.19.1
	github.com/go-sql-driver/mysql v1.9.3
)

require (
	github.com/hashicorp/errwrap v1.1.0 // indirect
	github.com/hashicorp/go-multierror v1.1.1 // indirect
	filippo.io/edwards25519 v1.1.0 // indirect
	go.uber.org/atomic v1.7.0 // indirect
)

replace github.com/TheBlackHowling/typedb/integration_tests/testhelpers => ../testhelpers
