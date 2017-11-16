require 'httparty'
require 'yaml'

class NasaApi
  include HTTParty

  attr_accessor :uri

  def initialize
    token = YAML.load_file('token.yml')
    @token = token['token']
  end

  base_uri 'https://api.nasa.gov/'

  def iotd
    iotd = JSON.parse(self.class.get("/planetary/apod?api_key=#{@token}").body)
  end

  def neo(start_date, end_date)
    neo = JSON.parse(self.class.get("/neo/rest/v1/feed?start_date=#{start_date}&end_date=#{end_date}&api_key=#{@token}").body)
  end

  def neo_all
    neo_all = JSON.parse(self.class.get("/neo/rest/v1/neo/browse?api_key=#{@token}").body)
  end

  def epic(i)
    epic = JSON.parse(self.class.get("/EPIC/#{i}?api_key=#{@token}").body)
  end
end
