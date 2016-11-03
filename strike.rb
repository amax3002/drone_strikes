require './db_connect'
require 'bundler/setup'
require 'httparty'
require 'pry'

require 'active_support'
require 'active_support/core_ext'

require './dronestrikeclient'

class Strike < ActiveRecord::Base


end
