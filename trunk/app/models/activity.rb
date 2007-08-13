class Activity < ActiveRecord::Base
  has_many :fiscal_transactions, :order => "created_at DESC"
  
  has_and_belongs_to_many :records
  
  def self.upcoming_activities
  	find(:all,
  		 :conditions => "start_time >= now()",
  		 :limit		 => 5,
  		 :order		 => "start_time ASC")
  end
end
