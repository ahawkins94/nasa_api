require 'httparty'
require 'yaml'

class NasaApi
  include HTTParty

  attr_accessor :uri

  def initialize
    token = YAML.load_file('token.yml')
    @token = token['token']
    @uri = ""
  end
  base_uri 'https://api.nasa.gov/planetary'

  def iotd
    iotd = JSON.parse(self.class.get("/apod?apikey=#{@token}").body)
  end

end
