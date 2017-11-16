require 'spec_helper'

describe 'Nasa tests' do

  before(:all) do
    nasa = NasaApi.new
    @iotd = nasa.iotd
    @neo = nasa.neo("2015-09-07", "2015-09-08")
    @neo_all = nasa.neo_all
    @epic = nasa.epic("/api/natural/images")
  end

  #testing image of the day
  it 'explanation should be a string' do
    expect(@iotd['explanation']).to be_a(String)
  end

  #testing near earth object data based on date
  it 'should return the data in neo as hashes' do
    expect(@neo['links']).to be_a(Hash)
  end

  #testing all the near earth object data
  it 'should return the data in neo_all as hashes' do
    expect(@neo_all).to be_a(Hash)
  end

  #testing data from the epic
  it 'epic should have the data type of an array' do
    expect(@epic).to be_a(Array)
  end

end
