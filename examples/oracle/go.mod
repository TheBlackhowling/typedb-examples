module github.com/TheBlackHowling/typedb/examples/oracle

go 1.24.0

require (
	github.com/TheBlackHowling/typedb v1.0.12
	github.com/TheBlackHowling/typedb/examples/seed v0.0.0
	github.com/sijms/go-ora/v2 v2.8.3
)

require github.com/jaswdr/faker v1.19.1 // indirect

replace github.com/TheBlackHowling/typedb/examples/seed => ../seed
