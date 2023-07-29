# read-endpoints
This is a repository made to integrate multiple API endpoints from multiple sources into one aggregate endpoint.
This is a completed project. 
To emulate each source endpoint, I used a separate language and/or framework.
All the aggregated endpoints will be sourced to a nodejs/fastify web server, which will then join the data into a final result endpoint. 

## Current scaffolding:
1. The first endpoint is written in Go and uses the Gin framework. It retrieves the author names.
2. The second endpoint is written in Python and uses the Flask framework. It retrieves the book titles.
3. The third endpoint is written in Ruby and uses the Sinatra framework. It retrieves the top quotes from each book.
4. The final endpoint is the wrapper that collects/aggregates the 3 sources of data into one endpoint and displays the results of that endpoint.

### Dependencies:

#### Go Dependencies:
- "github.com/gin-gonic/gin"
- "github.com/go-sql-driver/mysql"
- "github.com/pkg/errors" (for testing)
- "github.com/stretchr/testify/assert" (for testing)
* internal standard library dependencies not listed, but can be compiled during setup

#### Ruby Dependencies:
- sinatra
- mysql2
- json
- rack-test

#### Python Dependencies:
- flask
- flask_mysqldb
- flask_cors
  
#### NodeJS Dependencies:
- fastify

  **Also note that relevant sql files and unit test files are included in each source endpoint.

### Putting it all together:

1. Launch the Go endpoint:
Navigate to the project directory and run
```sh
go run main.go
```
You can view the JSON output via the link, e.g.
```sh
http://127.0.0.1:8080/titles
```
2. Launch the Ruby endpoint:
Navigate to the project directory and run
```sh
ruby top_quotes.rb
```
You can view the JSON output via the link, e.g.
```sh
http://127.0.0.1:4567/quotes
```
3. Launch the Python endpoint:
Navigate to the project directory and run
```sh
python top-authors.py
```
You can view the JSON output via the link, e.g.
```sh
http://127.0.0.1:5000/authors
```
3. Launch the NodeJS wrapper / Fastify endpoint that collects all three endpoints' source data:
Navigate to the project directory and run
```sh
node server.js
```
You can view the JSON output via the link, e.g.
```sh
http://127.0.0.1:3000/bookdetails
```
