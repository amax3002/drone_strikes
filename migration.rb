require 'active_record'
require 'sqlite3'
require './db_connect'

ActiveRecord::Migration.verbose = false

class Migration < ActiveRecord::Migration[5.0]

  def change
    create_table :strikes do |t|
      t.string :_id
      t.integer :number
      t.string :country
      t.string :date
      t.text :narrative
      t.string :town
      t.integer :location
      t.integer :deaths
      t.integer :deaths_min
      t.integer :deaths_max
      t.integer :civilians
      t.integer :injuries
      t.integer :children
      t.string :tweet_id
      t.string :bureau_id
      t.text :bij_summary_short
      t.string :bij_link
      t.string :target
      t.float :lat
      t.float  :lon
      t.text :articles
      t.text :names
    end

    def change
      create_table :strikes do |t|
        t.integer :strikes_id
      end

  end
end
