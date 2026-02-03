module github.com/TheBlackHowling/typedb/examples/oracle

go 1.23

require (
	github.com/TheBlackHowling/typedb v1.0.11
	github.com/TheBlackHowling/typedb/examples/seed v0.0.0
	github.com/golang-migrate/migrate/v4 v4.19.1
	github.com/sijms/go-ora/v2 v2.8.3
)

require (
	github.com/hashicorp/errwrap v1.1.0 // indirect
	github.com/hashicorp/go-multierror v1.1.1 // indirect
	github.com/jaswdr/faker v1.19.1 // indirect
	go.uber.org/atomic v1.7.0 // indirect
)

replace github.com/TheBlackHowling/typedb/examples/seed => ../seed
