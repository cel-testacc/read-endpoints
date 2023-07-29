'use strict'

const fastify = require('fastify')
const _ = require('underscore')

function build(opts={}) {
  const booksapi = fastify(opts)
  booksapi.get('/', async(request, reply) => {
    return "Hello, there's nothing here, the actual API is located at http://127.0.0.1:3000/bookdetails"
  })
  booksapi.route({
    method: 'GET',
    url: '/bookdetails',
    preHandler: async(request, reply) => {},
    handler: async(request, reply) => {
      const response_authors = await fetch('http://127.0.0.1:5000/authors')
      const json_authors = await response_authors.json()
      const response_titles = await fetch('http://127.0.0.1:8080/titles')
      const json_titles = await response_titles.json()
      const response_quotes = await fetch('http://127.0.0.1:4567/quotes')
      const json_quotes = await response_quotes.json()
      let bookdetails = {}
      for(let a = 0; a < json_authors.length; a++){
        bookdetails[json_authors[a][1]] = []
        let titles = {}
        for(let t = 0; t < json_titles.length; t++) {
          if(a+1 == json_titles[t].AuthorID) {
            let quotes = []
            for(let q = 0; q < json_quotes.length; q++){
              if(json_titles[t].ID == json_quotes[q].title_id){
                quotes.push(json_quotes[q].quote)
              }
            }
            titles[json_titles[t].Title] = JSON.stringify(quotes)
          }
        }
        bookdetails[json_authors[a][1]] = titles
      }

      return bookdetails
    }
  })

  return booksapi
}

module.exports = build
