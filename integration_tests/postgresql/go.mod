module github.com/TheBlackHowling/typedb/integration_tests/postgresql

go 1.23

require (
	github.com/TheBlackHowling/typedb v1.0.11
	github.com/TheBlackHowling/typedb/integration_tests/testhelpers v0.0.0
	github.com/golang-migrate/migrate/v4 v4.19.1
	github.com/lib/pq v1.10.9
)

require (
	github.com/hashicorp/errwrap v1.1.0 // indirect
	github.com/hashicorp/go-multierror v1.1.1 // indirect
	go.uber.org/atomic v1.7.0 // indirect
)

replace github.com/TheBlackHowling/typedb/integration_tests/testhelpers => ../testhelpers
