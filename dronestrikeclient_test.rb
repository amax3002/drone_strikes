require 'minitest/autorun'
require 'minitest/pride'
require 'webmock/minitest'

require './dronestrikeclient'

require 'active_support'
require 'active_support/core_ext'

class DroneStrikeClientTest < Minitest::Test
  def setup
    stub_request(
      :get,
      "http://api.dronestre.am/data.json"
    ).to_return(
      :status => 200,
      :body => File.read("responses/all_drone_strikes.json"),
      :headers => {'Content-Type' => 'application/json'}
    )

  end

  def test_class_exists
    assert DroneStrikeClient
  end

  def test_first
    raptor = DroneStrikeClient.new
    assert_equal "Yemen", raptor.strikes.first["country"]
  end

  def test_first_another_way
    raptor = DroneStrikeClient.new
    assert_equal "Yemen", raptor.strikes[0]["country"]
  end

  def test_put_all_data_in_sqlite3
    raptor = DroneStrikeClient.new.save
    assert_equal "Yemen", raptor.first["country"]
  end

end
