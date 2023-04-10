require 'sinatra'
require 'mysql2'
require 'json'

get '/' do
  varcheck = ""
  begin
    client = Mysql2::Client.new(:host => ENV["DBHOST"], :username => ENV["DBUSER"], :password => ENV["DBPASS"], :database => ENV["DBSQLENDPOINTS"], :as => :hash)
    results = client.query("SELECT * from authors")
    jsonstring = Array.new
    results.each do |row|
      jsonstring.push(row)
    end
    varcheck = JSON.generate(jsonstring)
  end
  [200, varcheck]
end
