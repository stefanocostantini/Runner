class CreateGoals < ActiveRecord::Migration
  def self.up
    create_table :goals do |t|
      t.float :distance
      t.integer :hours
      t.integer :minutes
      t.integer :seconds
      t.integer :duration
      t.float :avgspeed
      t.integer :pace_minutes
      t.integer :pace_seconds
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :goals
  end
end
