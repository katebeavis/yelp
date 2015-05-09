ActiveRecord::Schema.define(version: 20150411094931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'endorsements', force: :cascade do |t|
    t.integer  'review_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_index 'endorsements', ['review_id'], name: 'index_endorsements_on_review_id', using: :btree

  create_table 'restaurants', force: :cascade do |t|
    t.string   'name'
    t.integer  'rating'
    t.datetime 'created_at',         null: false
    t.datetime 'updated_at',         null: false
    t.text     'description'
    t.integer  'user_id'
    t.string   'image_file_name'
    t.string   'image_content_type'
    t.integer  'image_file_size'
    t.datetime 'image_updated_at'
  end

  add_index 'restaurants', ['user_id'], name: 'index_restaurants_on_user_id', using: :btree

  create_table 'reviews', force: :cascade do |t|
    t.text     'thoughts'
    t.integer  'rating'
    t.datetime 'created_at',    null: false
    t.datetime 'updated_at',    null: false
    t.integer  'restaurant_id'
    t.integer  'user_id'
  end

  add_index 'reviews', ['restaurant_id'], name: 'index_reviews_on_restaurant_id', using: :btree
  add_index 'reviews', ['user_id'], name: 'index_reviews_on_user_id', using: :btree

  create_table 'users', force: :cascade do |t|
    t.string   'email',                  default: '', null: false
    t.string   'encrypted_password',     default: '', null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer  'sign_in_count',          default: 0,  null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet     'current_sign_in_ip'
    t.inet     'last_sign_in_ip'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.string   'provider'
    t.string   'uid'
  end

  add_index 'users', ['email'], name: 'index_users_on_email', unique: true, using: :btree
  add_index 'users', ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true, using: :btree

  add_foreign_key 'endorsements', 'reviews'
  add_foreign_key 'restaurants', 'users'
  add_foreign_key 'reviews', 'restaurants'
  add_foreign_key 'reviews', 'users'
end
