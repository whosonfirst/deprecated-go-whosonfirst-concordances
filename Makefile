prep:
	if test -d pkg; then rm -rf pkg; fi

self:   prep
	if test -d src/github.com/whosonfirst/go-whosonfirst-concordances; then rm -rf src/github.com/whosonfirst/go-whosonfirst-concordances; fi
	mkdir -p src/github.com/whosonfirst/go-whosonfirst-concordances
	cp concordances.go src/github.com/whosonfirst/go-whosonfirst-concordances/concordances.go

deps:
	go get -u "github.com/whosonfirst/go-whosonfirst-crawl"
	go get -u "github.com/whosonfirst/go-whosonfirst-geojson"

fmt:
	go fmt *.go
	go fmt cmd/*.go

bin:	self
	go build -o bin/wof-concordances-list cmd/wof-concordances-list.go
