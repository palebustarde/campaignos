class ChartController < ApplicationController
	def getchart1
		#get the swfchart object out of the session and render
		swf = session[:swfchart1]
		
		render :text => swf.get_source_xml
	end
end
