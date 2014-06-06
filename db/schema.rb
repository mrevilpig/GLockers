# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140604221447) do

  create_table "accesses", force: true do |t|
    t.integer  "box_id"
    t.string   "barcode"
    t.string   "pin"
    t.integer  "update_request_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accesses", ["box_id"], name: "index_accesses_on_box_id"
  add_index "accesses", ["update_request_id"], name: "index_accesses_on_update_request_id"

  create_table "boxes", force: true do |t|
    t.integer  "locker_id"
    t.string   "name"
    t.integer  "size"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boxes", ["locker_id"], name: "index_boxes_on_locker_id"

  create_table "branches", force: true do |t|
    t.string   "name"
    t.string   "st_address"
    t.string   "apt_address"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devicelogs", force: true do |t|
    t.integer  "locker_id"
    t.integer  "type"
    t.string   "barcode"
    t.integer  "employee_id"
    t.datetime "time"
    t.integer  "package_id"
    t.integer  "package_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "mobile_phone"
    t.string   "email"
    t.string   "username"
    t.integer  "role"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lockers", force: true do |t|
    t.integer  "branch_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "permission_request_id", limit: 255
    t.integer  "access_request_id",     limit: 255
  end

  add_index "lockers", ["branch_id"], name: "index_lockers_on_branch_id"

  create_table "loggings", force: true do |t|
    t.datetime "open_time"
    t.datetime "close_time"
    t.integer  "occupied_when_open",  limit: 1
    t.integer  "occupied_when_close", limit: 1
    t.integer  "log_type",            limit: 1
    t.integer  "box_id"
    t.integer  "employee_id"
    t.integer  "box_status"
    t.integer  "action_type"
    t.datetime "request_time"
    t.integer  "package_id"
    t.integer  "package_status"
    t.integer  "syntax_type"
  end

  add_index "loggings", ["box_id"], name: "index_loggings_on_box_id"
  add_index "loggings", ["employee_id"], name: "index_loggings_on_employee_id"
  add_index "loggings", ["package_id"], name: "index_loggings_on_package_id"

  create_table "packages", force: true do |t|
    t.integer  "user_id"
    t.integer  "box_id"
    t.integer  "size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "barcode"
    t.integer  "status",              limit: 2
    t.integer  "backup_box_id"
    t.integer  "preferred_branch_id"
  end

  add_index "packages", ["box_id"], name: "index_packages_on_box_id"
  add_index "packages", ["user_id"], name: "index_packages_on_user_id"

  create_table "permissions", force: true do |t|
    t.integer  "employee_id"
    t.integer  "box_id"
    t.integer  "level",             limit: 1
    t.integer  "update_request_id", limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissions", ["box_id"], name: "index_permissions_on_box_id"
  add_index "permissions", ["employee_id"], name: "index_permissions_on_employee_id"
  add_index "permissions", ["update_request_id"], name: "index_permissions_on_update_request_id"

  create_table "privileges", force: true do |t|
    t.integer  "employee_id"
    t.integer  "locker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "name"
    t.string   "abbr"
    t.string   "ansi_code"
    t.string   "statens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trackings", force: true do |t|
    t.integer  "package_id"
    t.integer  "employee_id"
    t.datetime "time"
    t.integer  "type"
    t.integer  "branch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trackings", ["branch_id"], name: "index_trackings_on_branch_id"
  add_index "trackings", ["employee_id"], name: "index_trackings_on_employee_id"
  add_index "trackings", ["package_id"], name: "index_trackings_on_package_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "email"
    t.string   "st_address"
    t.string   "apt_address"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zip"
    t.integer  "preferred_branch_id"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["preferred_branch_id"], name: "index_users_on_preferred_branch_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
