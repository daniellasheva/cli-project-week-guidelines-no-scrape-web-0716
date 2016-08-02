require "rest-client"
require "json"
require "pry"

class NYCSchoolsAPIWrapper

  attr_accessor :all_schools_hash

  def initialize
    schools_json = RestClient.get('https://data.cityofnewyork.us/resource/734v-jeq5.json')
    @all_schools_hash = JSON.parse(schools_json)
  end



end
