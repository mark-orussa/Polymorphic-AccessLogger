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

ActiveRecord::Schema.define(version: 20180520234733) do

  create_table "access_logs", force: :cascade do |t|
    t.integer "created_by_id", null: false
    t.integer "updated_by_id", null: false
    t.string "access_loggable_type"
    t.integer "access_loggable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_loggable_type", "access_loggable_id"], name: "index_access_logs"
    t.index ["created_by_id"], name: "index_access_logs_on_created_by_id"
    t.index ["updated_by_id"], name: "index_access_logs_on_updated_by_id"
  end

  create_table "cheeses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monkeys", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
