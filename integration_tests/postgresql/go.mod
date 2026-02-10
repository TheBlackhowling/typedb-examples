module github.com/TheBlackHowling/typedb/integration_tests/postgresql

go 1.24.0

require (
	github.com/TheBlackHowling/typedb v1.0.12
	github.com/TheBlackHowling/typedb/integration_tests/testhelpers v0.0.0
	github.com/lib/pq v1.10.9
)

replace github.com/TheBlackHowling/typedb/integration_tests/testhelpers => ../testhelpers
