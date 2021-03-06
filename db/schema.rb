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

ActiveRecord::Schema.define(version: 20170502170130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rental_items", force: :cascade do |t|
    t.integer  "rental_id"
    t.integer  "tool_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.integer  "renter_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "total_cents"
    t.string   "stripe_charge_id"
    t.boolean  "returned",           default: false
    t.string   "stripe_customer_id"
    t.string   "stripe_card_id"
    t.index ["renter_id"], name: "index_rentals_on_renter_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.integer  "rental_item_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "comment"
  end

  create_table "tools", force: :cascade do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.text     "description"
    t.float    "lat"
    t.float    "lng"
    t.integer  "deposit_cents"
    t.integer  "daily_rate_cents"
    t.boolean  "availability",         default: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "city"
    t.string   "province"
    t.integer  "category_id"
    t.string   "street_address"
    t.string   "full_address"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.index ["owner_id"], name: "index_tools_on_owner_id", using: :btree
  end

  create_table "tools_dictionaries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "admin",            default: false
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

end
