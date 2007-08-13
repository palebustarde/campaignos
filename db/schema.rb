# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 1) do

  create_table "accounts_types", :force => true do |t|
    t.column "name", :string
    t.column "description", :string
    t.column "type", :string, :limit => 0, :default => "Other", :null => false
  end

  create_table "activities", :force => true do |t|
    t.column "summary", :text
    t.column "city", :string, :limit => 50
    t.column "state", :string, :limit => 50
    t.column "postal", :string, :limit => 11
    t.column "status", :string, :limit => 155
    t.column "start_time", :datetime
    t.column "end_time", :datetime
    t.column "notes", :text
    t.column "record_id", :integer
    t.column "user_id", :integer
    t.column "created_on", :datetime
    t.column "updated_on", :datetime
    t.column "name", :string, :limit => 50
  end

  create_table "campaigns", :force => true do |t|
    t.column "corp_title", :string, :limit => 155
    t.column "party", :string
    t.column "candidate", :string, :limit => 155
    t.column "type", :string, :limit => 155
    t.column "precinct", :integer, :limit => 5
    t.column "manager_id", :integer
    t.column "street1", :string
    t.column "street2", :string
    t.column "city", :string
    t.column "county", :string
    t.column "state", :string, :limit => 10
    t.column "postal", :string, :limit => 11
    t.column "phone", :string, :limit => 15
    t.column "phone_alt", :string, :limit => 15
    t.column "email", :string
    t.column "email_alt", :string
    t.column "fax", :string, :limit => 15
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "mobile", :string, :limit => 15
  end

  create_table "cities", :force => true do |t|
    t.column "name", :string, :limit => 64
    t.column "county_id", :integer
  end

  create_table "counties", :force => true do |t|
    t.column "name", :string, :limit => 64
    t.column "state_id", :integer
  end

  create_table "countries", :force => true do |t|
    t.column "name", :string, :limit => 64
    t.column "code", :string, :limit => 3
  end

  create_table "elections", :force => true do |t|
    t.column "name", :string, :limit => 155, :default => "", :null => false
    t.column "description", :string, :default => "", :null => false
    t.column "start_date", :datetime, :null => false
    t.column "end_date", :datetime, :null => false
  end

  create_table "fiscal_transactions", :force => true do |t|
    t.column "record_id", :integer
    t.column "created_on", :datetime
    t.column "posted_at", :datetime
    t.column "updated_on", :datetime
    t.column "amount", :float
    t.column "account_id", :integer
    t.column "election_id", :integer
    t.column "payment_type", :string, :limit => 40
    t.column "institution", :string, :limit => 155
    t.column "card_name", :string
    t.column "card_number", :integer, :limit => 16
    t.column "expiration_month", :integer, :limit => 2
    t.column "expiration_year", :integer, :limit => 4
    t.column "card_type", :string, :limit => 4
    t.column "verify_pin", :integer, :limit => 3
    t.column "reoccuring", :string, :limit => 1
    t.column "check_humber", :integer
    t.column "note", :string
    t.column "activity_id", :integer
    t.column "bank_name", :string, :limit => 155
    t.column "bank_account", :string, :limit => 16
    t.column "bank_transit", :integer, :limit => 16
  end

  add_index "fiscal_transactions", ["record_id"], :name => "record_id"
  add_index "fiscal_transactions", ["account_id"], :name => "account_id"
  add_index "fiscal_transactions", ["election_id"], :name => "election_id"

  create_table "records", :force => true do |t|
    t.column "title", :string, :limit => 5
    t.column "campaign_id", :integer, :default => 0, :null => false
    t.column "first_name", :string
    t.column "middle_name", :string
    t.column "last_name", :string
    t.column "precinct", :integer, :limit => 5
    t.column "street1", :string
    t.column "street2", :string
    t.column "county", :string
    t.column "city", :string
    t.column "state", :string, :limit => 10
    t.column "postal", :string, :limit => 11
    t.column "phone_home", :string, :limit => 25
    t.column "phone_mobile", :string, :limit => 25
    t.column "phone_work", :string, :limit => 25
    t.column "phone_fax", :string, :limit => 25
    t.column "employer", :string
    t.column "occupation", :string
    t.column "ethnicity", :string
    t.column "date_of_birth", :date
    t.column "gender", :string, :limit => 1
    t.column "voteriden", :integer
    t.column "creditcard", :integer, :limit => 16
    t.column "expiration_month", :integer, :limit => 2
    t.column "expiration_year", :integer, :limit => 4
    t.column "registered", :string, :limit => 1
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "card_type", :string, :limit => 4
    t.column "bank_account", :string, :limit => 16
    t.column "bank_transit", :integer, :limit => 16
    t.column "bank_name", :string, :limit => 155
    t.column "corporate_name", :string, :limit => 155
    t.column "do_not_call", :string, :limit => 3, :default => "0"
    t.column "do_not_email", :string, :limit => 3, :default => "0"
    t.column "created_on", :datetime
    t.column "updated_on", :datetime
    t.column "user_id", :integer
    t.column "assigned_user_id", :integer
    t.column "salutation", :string, :limit => 5
    t.column "lead_source", :string, :limit => 100
    t.column "record_id", :integer
    t.column "email", :string, :limit => 155
    t.column "email_other", :string, :limit => 155
    t.column "industry", :string, :limit => 50
    t.column "team_id", :integer
    t.column "website", :string, :limit => 155
  end

  add_index "records", ["campaign_id"], :name => "campaign_id"

  create_table "records_activities", :id => false, :force => true do |t|
    t.column "record_id", :integer
    t.column "activity_id", :integer
  end

  add_index "records_activities", ["record_id"], :name => "record_id"

  create_table "states", :force => true do |t|
    t.column "name", :string, :limit => 64
    t.column "code", :string, :limit => 3
    t.column "country_id", :integer
  end

  create_table "taggings", :force => true do |t|
    t.column "tag_id", :integer
    t.column "taggable_id", :integer
    t.column "taggable_type", :string
  end

  create_table "tags", :force => true do |t|
    t.column "name", :string
  end

end
