require './db_connect'
require 'bundler/setup'
require 'httparty'
require 'pry'
require './strike'


require 'active_support'
require 'active_support/core_ext'


class DroneStrikeClient
  BASE_URI = "http://api.dronestre.am/data"

  def get
    HTTParty.get"#{BASE_URI}.json"
  end

  def strikes
    get['strike']
  end

  def save
    strikes.each do |strike|
      Strike.create!(
      _id:  strike["_id"],
      number:  strike["number"],
      country:  strike["country"],
      date:  strike["date"],
      narrative:  strike["narrative"],
      town:  strike["town"],
      location:  strike["id"],
      deaths:  strike["id"],
      deaths_min:  strike["deaths_min"],
      deaths_max:  strike["deaths_max"],
      civilians:  strike["civilians"],
      injuries:  strike["injuries"],
      children:  strike["children"],
      tweet_id:  strike["tweet_id"],
      bureau_id:  strike["bureau_id"],
      bij_summary_short:  strike["bij_summary_short"],
      bij_link:  strike["bij_link"],
      target:  strike["target"],
      lat:  strike["lat"],
      lon:  strike["lon"],
      articles:  strike["articles"],
      names:  strike["names"]
      )
    end
  end
end
