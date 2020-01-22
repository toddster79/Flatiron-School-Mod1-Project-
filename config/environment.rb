require 'bundler/setup'
Bundler.require()

require_all 'lib'

#response = RestClient.get('https://rickandmortyapi.com/api/charater/')
#parsed_response = JSON.parse(response)