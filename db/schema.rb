# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_01_22_170525) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.string "plate_number"
    t.string "year"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "license_number"
    t.string "phone"
    t.bigint "car_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_drivers_on_car_id"
  end

  create_table "rides", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "car_id", null: false
    t.text "pickup_location"
    t.text "dropoff_location"
    t.string "fare"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_rides_on_car_id"
    t.index ["client_id"], name: "index_rides_on_client_id"
  end

  add_foreign_key "drivers", "cars"
  add_foreign_key "rides", "cars"
  add_foreign_key "rides", "clients"
end
