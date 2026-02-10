module github.com/TheBlackHowling/typedb/examples/sqlite

go 1.23

require (
	github.com/TheBlackHowling/typedb v1.0.12
	github.com/TheBlackHowling/typedb/examples/seed v0.0.0
	github.com/mattn/go-sqlite3 v1.14.33
)

require github.com/jaswdr/faker v1.19.1 // indirect

replace github.com/TheBlackHowling/typedb/examples/seed => ../seed
