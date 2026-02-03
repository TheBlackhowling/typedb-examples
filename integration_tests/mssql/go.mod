module github.com/TheBlackHowling/typedb/integration_tests/mssql

go 1.23

require (
	github.com/TheBlackHowling/typedb v1.0.11
	github.com/TheBlackHowling/typedb/integration_tests/testhelpers v0.0.0
	github.com/golang-migrate/migrate/v4 v4.19.1
	github.com/microsoft/go-mssqldb v1.9.6
)

require (
	github.com/golang-sql/civil v0.0.0-20220223132316-b832511892a9 // indirect
	github.com/golang-sql/sqlexp v0.1.0 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/hashicorp/errwrap v1.1.0 // indirect
	github.com/hashicorp/go-multierror v1.1.1 // indirect
	github.com/shopspring/decimal v1.4.0 // indirect
	go.uber.org/atomic v1.7.0 // indirect
	golang.org/x/crypto v0.45.0 // indirect
	golang.org/x/text v0.31.0 // indirect
)

replace github.com/TheBlackHowling/typedb/integration_tests/testhelpers => ../testhelpers
