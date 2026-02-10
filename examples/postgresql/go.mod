module github.com/TheBlackHowling/typedb/examples/postgresql

go 1.23

require (
	github.com/TheBlackHowling/typedb v1.0.12
	github.com/TheBlackHowling/typedb/examples/seed v0.0.0
	github.com/lib/pq v1.10.9
)

require github.com/jaswdr/faker v1.19.1 // indirect

replace github.com/TheBlackHowling/typedb/examples/seed => ../seed
