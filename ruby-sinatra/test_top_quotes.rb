ENV['APP_ENV'] = 'test'

require_relative 'top_quotes'
require 'test/unit'
require 'rack/test'

class TopQuotesTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_default
    get '/'
    assert last_response.ok?
    assert_equal 'Hello World!', last_response.body
  end

  def test_quotes
    get '/quotes'
    assert last_response.ok?
    assert_match '“So it goes.”', last_response.body
  end
end
