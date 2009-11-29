class CreateRuns < ActiveRecord::Migration
  def self.up
    create_table :runs do |t|
      t.float :distance
      t.float :distance_comparison
      t.integer :hours
      t.integer :minutes
      t.integer :seconds
      t.float :duration
      t.float :duration_comparison
      t.float :avgspeed
      t.float :avgspeed_comparison
	  t.float :total_comparison
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :runs
  end
end
