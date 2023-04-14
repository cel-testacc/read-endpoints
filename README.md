# read-endpoints
This is a repository made to integrate multiple API endpoints from multiple sources into one aggregate endpoint.

This is an ongoing project. 
To emulate each source endpoint, I used a separate language and/or framework.
All the aggregated endpoints will be sourced to a nodejs/fastify web server, which will then join the data into a final result endpoint. 
The goal is to expand the projects and add multiple languages/frameworks that are easily swappable for testing purposes.

## Current scaffolding:
1. The first endpoint is written in Go and uses the Gin framework. It retrieves the author names.
2. The second endpoint is written in Python and uses the Flask framework. It retrieves the book titles.
3. The third endpoint is written in Ruby and uses the Sinatra framework. It retrieves the top quotes from each book.

### TODO:
write the fastify wrapper that aggregates the 3 endpoints and returns the data 
