module github.com/TheBlackHowling/typedb/integration_tests/oracle

go 1.24.0

require (
	github.com/TheBlackHowling/typedb v1.0.12
	github.com/TheBlackHowling/typedb/integration_tests/testhelpers v0.0.0
	github.com/sijms/go-ora/v2 v2.9.0
)

replace github.com/TheBlackHowling/typedb/integration_tests/testhelpers => ../testhelpers
