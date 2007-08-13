class FiscalTransaction < ActiveRecord::Base
  belongs_to :activity
  belongs_to :record
  belongs_to :election
  belongs_to :account
  
    
  def self.recent_fiscal_transactions
  	find(:all,
  		 :conditions => "created_on <= now()",
  		 :limit		 => 5,
  		 :order		 => "created_on DESC")
  end
  	
  def self.upcoming_activities
  	find(:all,
  		 :conditions => "start_time >= now()",
  		 :limit		 => 5,
  		 :order		 => "start_time ASC")
  end
end
