ENV["RACK_ENV"] = "test"

require "./fifty_fifty"
require "test/unit"
require "rack/test"

class AuthenticationTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    FiftyFifty.new
  end

  def test_authenticated_request
    get '/fifty_fifty', {}, {"HTTP_AUTHORIZATION" => "Bearer #{ENV.fetch('AUTH_TOKEN')}"}
    assert(
      (last_response.status == 200 && last_response.body.length > 0) ||
      (last_response.status == 500 && last_response.body.length == 0 )
    )
  end

  def test_unauthenticated_request
    get '/fifty_fifty'
    assert last_response.status == 401 && last_response.body.length == 0
  end

  def test_overall_availability
    successes = 0
    100.times do
      get '/fifty_fifty', {}, {"HTTP_AUTHORIZATION" => "Bearer #{ENV.fetch('AUTH_TOKEN')}"}
      successes += 1 if last_response.status == 200
    end
    assert 40 <= successes && successes <= 60
  end
end
