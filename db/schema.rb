# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091115175255) do

  create_table "goals", :force => true do |t|
    t.float    "distance"
    t.integer  "hours"
    t.integer  "minutes"
    t.integer  "seconds"
    t.integer  "duration"
    t.float    "avgspeed"
    t.integer  "pace_minutes"
    t.integer  "pace_seconds"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "runs", :force => true do |t|
    t.float    "distance"
    t.float    "distance_comparison"
    t.integer  "hours"
    t.integer  "minutes"
    t.integer  "seconds"
    t.float    "duration"
    t.float    "duration_comparison"
    t.float    "avgspeed"
    t.float    "avgspeed_comparison"
    t.float    "total_comparison"
    t.text     "note"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
