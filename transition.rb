require './strike'
require 'json'

file = File.read('responses/all_drone_strikes.json')

data_hash = JSON.parse(file)

array_of_hashes = data_hash['strike']


puts array_of_hashes
