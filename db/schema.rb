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

ActiveRecord::Schema[7.0].define(version: 2023_11_03_145416) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billings", force: :cascade do |t|
    t.string "payment_method"
    t.float "amount"
    t.string "transaction_id"
    t.string "payment_status"
    t.bigint "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id", null: false
    t.index ["booking_id"], name: "index_billings_on_booking_id"
    t.index ["customer_id"], name: "index_billings_on_customer_id"
  end

  create_table "booking_rooms", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_rooms_on_booking_id"
    t.index ["room_id"], name: "index_booking_rooms_on_room_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "check_in"
    t.date "check_out"
    t.integer "no_of_guests"
    t.string "status"
    t.string "cancellation_policy"
    t.bigint "hotel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id", null: false
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["hotel_id"], name: "index_bookings_on_hotel_id"
  end

  create_table "check_in_outs", force: :cascade do |t|
    t.datetime "checked_in_time"
    t.datetime "checked_out_time"
    t.string "stay_status"
    t.bigint "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_check_in_outs_on_booking_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "phone_no"
    t.date "dob"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features", force: :cascade do |t|
    t.string "feature_name"
    t.text "feature_desc"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "rating"
    t.text "comments"
    t.bigint "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_feedbacks_on_booking_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "phone_no"
    t.bigint "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_guests_on_booking_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "description"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_availabilities", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.boolean "available"
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_availabilities_on_room_id"
  end

  create_table "room_type_features", force: :cascade do |t|
    t.bigint "room_type_id", null: false
    t.bigint "feature_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_room_type_features_on_feature_id"
    t.index ["room_type_id"], name: "index_room_type_features_on_room_type_id"
  end

  create_table "room_types", force: :cascade do |t|
    t.string "room_type"
    t.text "description"
    t.float "price"
    t.integer "occupancy_limit"
    t.string "image"
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_types_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room_no"
    t.bigint "hotel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

  add_foreign_key "billings", "bookings"
  add_foreign_key "billings", "customers"
  add_foreign_key "booking_rooms", "bookings"
  add_foreign_key "booking_rooms", "rooms"
  add_foreign_key "bookings", "customers"
  add_foreign_key "bookings", "hotels"
  add_foreign_key "check_in_outs", "bookings"
  add_foreign_key "feedbacks", "bookings"
  add_foreign_key "guests", "bookings"
  add_foreign_key "room_availabilities", "rooms"
  add_foreign_key "room_type_features", "features"
  add_foreign_key "room_type_features", "room_types"
  add_foreign_key "room_types", "rooms"
  add_foreign_key "rooms", "hotels"
end
