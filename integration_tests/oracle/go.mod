module github.com/TheBlackHowling/typedb/integration_tests/oracle

go 1.23

require (
	github.com/TheBlackHowling/typedb v1.0.11
	github.com/TheBlackHowling/typedb/integration_tests/testhelpers v0.0.0
	github.com/golang-migrate/migrate/v4 v4.19.1
	github.com/sijms/go-ora/v2 v2.9.0
)

require (
	github.com/hashicorp/errwrap v1.1.0 // indirect
	github.com/hashicorp/go-multierror v1.1.1 // indirect
	go.uber.org/atomic v1.7.0 // indirect
)

replace github.com/TheBlackHowling/typedb/integration_tests/testhelpers => ../testhelpers
