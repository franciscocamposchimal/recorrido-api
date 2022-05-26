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

ActiveRecord::Schema[7.0].define(version: 20_220_524_061_049) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'clients', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'days_takens', force: :cascade do |t|
    t.date 'day'
    t.bigint 'service_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id'
    t.index ['service_id'], name: 'index_days_takens_on_service_id'
    t.index ['user_id'], name: 'index_days_takens_on_user_id'
  end

  create_table 'services', force: :cascade do |t|
    t.date 'start_date'
    t.date 'end_date'
    t.time 'start_time'
    t.time 'end_time'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'client_id'
    t.index ['client_id'], name: 'index_services_on_client_id'
  end

  create_table 'timesheets', force: :cascade do |t|
    t.time 'hour'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'days_taken_id'
    t.index ['days_taken_id'], name: 'index_timesheets_on_days_taken_id'
    t.index ['user_id'], name: 'index_timesheets_on_user_id'
  end

  create_table 'turns', force: :cascade do |t|
    t.bigint 'days_taken_id'
    t.bigint 'user_id'
    t.bigint 'service_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['days_taken_id'], name: 'index_turns_on_days_taken_id'
    t.index ['service_id'], name: 'index_turns_on_service_id'
    t.index ['user_id'], name: 'index_turns_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'username'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'days_takens', 'services'
  add_foreign_key 'days_takens', 'users'
  add_foreign_key 'services', 'clients'
  add_foreign_key 'timesheets', 'days_takens'
  add_foreign_key 'timesheets', 'users'
  add_foreign_key 'turns', 'days_takens'
  add_foreign_key 'turns', 'services'
  add_foreign_key 'turns', 'users'
end
