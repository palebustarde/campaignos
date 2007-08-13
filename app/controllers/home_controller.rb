class HomeController < ApplicationController
  
  require 'SWFChart'
	
	def index
	  @title = "Home"
		@Description_1 = "Income by Type"
		
		@swf = SWFChart.new
		session[:swfchart1] = @swf
		
		#set data headings
		@swf.data_array = Array.new
		@swf.data_array[0] = [nil]
		@swf.data_array[1] = ['']
		@swf.data_array[2] = ['']
		@swf.data_array[3] = ['']

		@swf.data_array[0] << nil
		@swf.data_array[1] << "InKind"
		@swf.data_array[2] << "Corp"
		@swf.data_array[3] << "Ind"
		@swf.data_array[0] << "Jan"
		@swf.data_array[1] << 10
		@swf.data_array[2] << 35
		@swf.data_array[3] << 55
		@swf.data_array[0] << "Feb"
		@swf.data_array[1] << 25
		@swf.data_array[2] << 65
		@swf.data_array[3] << 30
		@swf.data_array[0] << "March"
		@swf.data_array[1] << 110
		@swf.data_array[2] << 80
		@swf.data_array[3] << 10
		
		@swf.vt_array = Array.new
		@swf.vt_array[0] = [nil]
		@swf.vt_array[1] = ['']
		@swf.vt_array[2] = ['']
		@swf.vt_array[3] = ['']
		
		@swf.vt_array[0] << nil
		@swf.vt_array[1] << nil
		@swf.vt_array[2] << nil
		@swf.vt_array[3] << nil
		@swf.vt_array[0] << nil
		@swf.vt_array[1] << nil
		@swf.vt_array[2] << nil
		@swf.vt_array[3] << nil
		@swf.vt_array[0] << nil
		@swf.vt_array[1] << nil
		@swf.vt_array[2] << nil
		@swf.vt_array[3] << nil
		@swf.vt_array[0] << nil
		@swf.vt_array[1] << nil
		@swf.vt_array[2] << nil
		@swf.vt_array[3] << nil

		@swf.chart_type = "area"
		@swf.chart_rect = {:x => '5',:width => '140',:height => '80'}
		@swf.legend_rect = {:x => '20', :y => '20', :width => '120', :height => '10'}
		
		@activities = Activity.upcoming_activities
  	@fiscal_transactions = FiscalTransaction.recent_fiscal_transactions
  end
end
