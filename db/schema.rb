# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_02_090408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avatar_styles", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "rendering_template"
    t.bigint "user_preference_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_preference_id"], name: "index_avatar_styles_on_user_preference_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name"
    t.string "lowest_temperature"
    t.string "highest_temperature"
    t.string "color"
    t.bigint "user_preference_id"
    t.bigint "wardrobe_templates_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "condition_array"
    t.string "render_string"
    t.index ["user_preference_id"], name: "index_items_on_user_preference_id"
    t.index ["wardrobe_templates_id"], name: "index_items_on_wardrobe_templates_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "destination"
    t.date "trip_start_date"
    t.date "trip_end_date"
    t.bigint "user_preference_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_preference_id"], name: "index_trips_on_user_preference_id"
  end

  create_table "user_preferences", force: :cascade do |t|
    t.string "default_address"
    t.string "address"
    t.integer "user_id"
    t.float "latitude"
    t.float "longitude"
    t.text "forecast"
    t.datetime "forecast_timestamp"
    t.string "city", default: "Berlin"
    t.integer "temp_br1", default: 0
    t.integer "temp_br2", default: 10
    t.integer "temp_br3", default: 20
    t.integer "temp_br4", default: 30
    t.time "notification_time"
    t.string "name", default: "Marc"
    t.string "avatar", default: "female"
    t.string "hairstyle"
    t.string "skin_tone", default: "#C58C85"
    t.string "avatar_rendering_string", default: "<g id='Body/Hoodie' stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'><path d='M190.781205,92.2114854 L222.679476,115.635084 C231.330944,117.969562 238.558965,120.874047 244.363541,124.34854 C245.734683,125.597945 247.391836,128.128197 241.70538,127.690906 C236.018925,127.253615 230.01796,127.049392 229.233339,128.988954 C228.448719,130.928516 231.889854,133.24802 230.303794,135.864997 C229.246421,137.609648 224.250967,133.234999 215.31743,122.74105 L183.729774,109.642447 L190.781205,92.2114854 Z M68.3079281,93.0198914 L89.2053198,93.1020711 C76.3021447,134.755739 69.3363474,156.856914 68.3079281,159.405597 C65.9939846,165.140133 70.8906002,173.873732 72.9845874,178.567103 C66.1645409,181.61887 66.8912241,170.316929 58.2879189,174.319492 C50.4352209,177.972846 44.4616931,184.59248 35.3890352,178.994371 C34.2736052,178.306117 33.0512757,175.714714 36.0045784,173.68967 C43.3623323,168.644547 53.9653015,159.814672 55.3979297,156.908251 C57.3515741,152.944826 61.6549068,131.648706 68.3079281,93.0198914 Z' id='Skin' fill='#C58C85'></path><path d='M122.731734,9.58031077 L131.216685,7.34914009 C165.5935,32.1628362 183.361709,84.0563407 224.996623,108.72736 L216.58973,121.240539 C147.889238,118.771641 125.383314,55.5469019 122.731734,9.58031077 Z' id='Coat-Back' fill='black' transform='translate(173.864178, 64.294840) rotate(5.000000) translate(-173.864178, -64.294840) '></path><path d='M90,114 C124.671756,114 150.175573,114 166.511451,114 C170.007634,114 169.348845,108.951637 168.84345,106.404206 C163.010588,77.0037663 140.241304,45.3115155 140.241304,3.4607303 L118.1718,0 C99.917485,29.3584068 93.6048263,65.5045499 90,114 Z' id='Shirt' fill='#DDE3E9'></path><path d='M90.6148413,28.8579585 C87.4095228,27.9365884 84.8712423,25.7876656 83,22.4111902 C74.933557,7.85607578 77.8467271,-0.157592785 86.4671964,-2.7917309 C95.0876658,-5.42586901 102.775319,-2.04281037e-14 116.510031,-7.10542736e-15 C117.257085,-6.21724894e-15 117.941303,0.0468325343 118.562683,0.140497603 L125.471587,0.534739944 C145.293986,67.7151944 150.760885,112.536948 141.872285,135 L81.6518141,135 C78.0838152,143.319871 74.6695413,150.319871 71.4089926,156 L55,156 C53.4556832,106.067091 65.327297,63.6864104 90.6148413,28.8579585 Z' id='Coat-Front' fill='black'></path><path d='M94.7652287,100.497634 C96.6591508,116.344024 99.7374079,127.844812 104,135 L81.6518141,135 C85.813785,125.295103 90.1849231,113.794314 94.7652283,100.497633 Z' id='Shade' fill-opacity='0.1' fill='#000000'></path></g>"
    t.index ["user_id"], name: "index_user_preferences_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wardrobe_templates", force: :cascade do |t|
    t.string "category"
    t.string "svg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "rendering_group"
  end

end
