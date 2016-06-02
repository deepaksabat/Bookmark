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

ActiveRecord::Schema.define(version: 20160330061727) do

  create_table "book_mark_labels", force: :cascade do |t|
    t.integer  "label_id",     limit: 4
    t.integer  "book_mark_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "book_mark_labels", ["book_mark_id"], name: "index_book_mark_labels_on_book_mark_id", using: :btree
  add_index "book_mark_labels", ["label_id"], name: "index_book_mark_labels_on_label_id", using: :btree

  create_table "book_marks", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "url",        limit: 255
    t.string   "note",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "book_marks", ["user_id"], name: "index_book_marks_on_user_id", using: :btree

  create_table "labels", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "labels", ["user_id"], name: "index_labels_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "book_mark_labels", "book_marks"
  add_foreign_key "book_mark_labels", "labels"
  add_foreign_key "book_marks", "users"
  add_foreign_key "labels", "users"
end
