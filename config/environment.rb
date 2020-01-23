require 'bundler/setup'
Bundler.require()

require_all 'lib'
require 'date'

ActiveRecord::Base.logger = nil
#response = RestClient.get('https://rickandmortyapi.com/api/charater/')
#parsed_response = JSON.parse(response)