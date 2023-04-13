require 'sinatra'
require 'mysql2'
require 'json'

get '/' do
  [200, 'Hello World!']
end

get '/quotes' do
  quotescheck = ""
  begin
    client = Mysql2::Client.new(:host => ENV["DBHOST"], :username => ENV["DBUSER"], :password => ENV["DBPASS"], :database => ENV["DBSQLENDPOINTS"], :as => :hash)
    results = client.query("SELECT * from quotes")
    quotesstring = Array.new
    results.each do |row|
      quotesstring.push(row)
    end

    quotescheck = JSON.generate(quotesstring)
  end

  [200, quotescheck]
end
