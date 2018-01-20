require "sinatra"

class FiftyFifty < Sinatra::Base
  set :server, :puma

  before do
    halt 401 unless request.env["HTTP_AUTHORIZATION"] == "Bearer #{ENV.fetch('AUTH_TOKEN')}"
  end

  get "/fifty_fifty" do
    halt 500 if [true, false].sample
    [200, {'Content-Type' => 'text/plain'}, File.read("./words.txt").split("\n").sample]
  end
end
