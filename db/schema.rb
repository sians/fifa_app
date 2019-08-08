# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_06_173516) do

  create_table "player_list_players", force: :cascade do |t|
    t.integer "player_list_id"
    t.integer "players_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_list_id"], name: "index_player_list_players_on_player_list_id"
    t.index ["players_id"], name: "index_player_list_players_on_players_id"
  end

  create_table "player_lists", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_player_lists_on_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "wage"
    t.integer "overall_rating"
    t.integer "potential_rating"
    t.integer "value"
    t.string "club"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
