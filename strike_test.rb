require 'minitest/autorun'
require 'minitest/pride'
require 'webmock/minitest'

require './strike'
require "./migration"

require 'active_support'
require 'active_support/core_ext'

class StrikeTest < Minitest::Test
  def setup
    stub_request(
    :get,
    "http://api.dronestre.am/data.json"
    ).to_return(
    :status => 200,
    :body => File.read("responses/all_drone_strikes.json"),
    :headers => {'Content-Type' => 'application/json'}
    )

    begin
      Migration.migrate(:down)
    rescue
    end

    Migration.migrate(:up)

    Strike.create!(_id: 2, number: "452435", country: "USA")
    Strike.create!(_id: 3, number: "452436", country: "France")
    Strike.create!(_id: 4, number: "452437", country: "Japan")

  end


  def test_class_exists
    assert Strike
  end

  def test_can_create_drone
    raptor = Strike.create!(_id: 5, number: "452435", country: "USA")
    assert_equal raptor["_id"], "5"
  end

  def test_loop_through_hash
    raptor = Strike.all
    assert_equal raptor, 2
  end
end
