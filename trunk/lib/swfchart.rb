class SWFChart
	require_gem 'builder'
	
	attr_accessor :height
	attr_accessor :width
	attr_accessor :bg_color
	attr_accessor :transparent
	attr_accessor :license
	attr_accessor :lib_path
	attr_accessor :flash_file
	attr_accessor :data_source
	attr_accessor :data_array
	attr_accessor :vt_array
	

	#direct swf parameters
	attr_accessor :axis_category
	attr_accessor :axis_ticks
	attr_accessor :axis_value
	attr_accessor :chart_border
	attr_accessor :chart_grid_h
	attr_accessor :chart_grid_v
	attr_accessor :chart_pref
	attr_accessor :chart_rect
	attr_accessor :chart_transition
	attr_accessor :chart_type
	attr_accessor :chart_value_text
	attr_accessor :chart_value
	attr_accessor :draw
	attr_accessor :legend_label
	attr_accessor :legend_rect
	attr_accessor :legend_transition
	attr_accessor :link
  
  
	attr_accessor :link_array
	attr_accessor :area
	
	attr_accessor :link_data
	attr_accessor :live_update
	attr_accessor :series_color
	attr_accessor :series_explode
	attr_accessor :series_gap
	attr_accessor :series_switch
	
	
	def initialize
		@height = "250"
		@width = "400"
		@bg_color = "666666"
		@transparent = false
		@license = ""
		@lib_path = "/charts_library"
		@flash_file = "/charts.swf"
	end
	
	def insert_chart(options={})
		@height = options[:height] unless options[:height].nil?
		@width = options[:width] unless options[:width].nil?
		@bg_color = options[:bg_color] unless options[:bg_color].nil?
		@transparent = options[:transparent] unless options[:transparent].nil?
		@license = options[:license] unless options[:license].nil?
		@lib_path = options[:lib_path] unless options[:lib_path].nil?
		@flash_file = options[:flash_file] unless options[:flash_file].nil?
		@data_source = options[:data_source] unless options[:data_source].nil?
		
		html = "<OBJECT classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0' "	
		html = html + "WIDTH=\"" + @width + "\" HEIGHT=\"" + @height + "\" id='charts' ALIGN=''> \n"
		
		@license = "&license=" + @license unless @license == ""
		
		html = html + "<PARAM NAME=movie VALUE='" + @flash_file + "?library_path=" + @lib_path + "&xml_source=" + @data_source + @license + "'> \n"
		html = html + "<PARAM NAME=quality VALUE=high> \n"
		html = html + "<PARAM NAME=bgcolor VALUE=#" + @bg_color + "> \n"
		html = html + "<PARAM NAME=wmode VALUE=transparent> \n" if @transparent
		html = html + "<EMBED src='" + @flash_file + "?library_path=" + @lib_path + "&xml_source=" + @data_source + @license + "' "
		html = html + "quality=high bgcolor=#" + @bg_color + " WIDTH=" + @width + " HEIGHT=" + @height + " NAME='charts' ALIGN='' swLiveConnect='true' "
		html = html + "wmode=transparent " if @transparent
		html = html + "TYPE='application/x-shockwave-flash' PLUGINSPAGE='http://www.macromedia.com/go/getflashplayer'></EMBED> \n" 
		html= html + "</OBJECT> \r\n"
		return html
	end
	
	def get_source_xml			 
		x = Builder::XmlMarkup.new()
		a =  x.chart {
			#render chart options
			if @chart_type.kind_of? Hash
				x.draw {
					for k,v in @draw  
						x.__send__(k,v)
					end
				}
			else
				x.chart_type(@chart_type)
			end

			#encode draw, draw is a hash of hashes
			if @draw.kind_of? Hash
				x.draw {
					for k,v in @draw  
						x.__send__(k,v)
					end
				}
			end
			
			if @series_gap.kind_of? Hash
				x.series_gap {
					for k,v in @series_gap  
						x.__send__(k,v)
					end
				}
			end
			
			#encode options passed as arrays
			if @series_color.kind_of? Array
			  x.series_color {
			    for c in @series_color
            x.__send__("color", c)
          end
			  }
			end
			
			if @series_explode.kind_of? Array
			  x.series_explode {
			    for e in @series_explode
            x.__send__("explode", e)
          end
			  }
			end
			
			if @link_array.kind_of? Array
			  x.link {
			    for l in @link_array
            x.__send__("area", l)
          end
			  }
			end
		
			x.series_switch(@series_switch) if @series_switch.kind_of? String
			
			#encode options passed as hash
			x.chart_rect('',@chart_rect) if @chart_rect.kind_of? Hash
			x.axis_category('',@axis_category) if @axis_category.kind_of? Hash
			x.axis_ticks('',@axis_ticks) if @axis_ticks.kind_of? Hash
			x.axis_value('',@axis_value) if @axis_value.kind_of? Hash
			x.chart_border('',@chart_border) if @chart_border.kind_of? Hash
			x.chart_grid_h('',@chart_grid_h) if @chart_border.kind_of? Hash
			x.chart_grid_v('',@chart_grid_v) if @chart_grid_v.kind_of? Hash
			x.chart_pref('',@chart_pref) if @chart_pref.kind_of? Hash
			x.chart_transition('',@chart_transition) if @chart_transition.kind_of? Hash
			x.legend_label('',@legend_label) if @legend_label.kind_of? Hash
			x.legend_rect('',@legend_rect) if @legend_rect.kind_of? Hash
			x.legend_transition('',@legend_transition) if @legend_transition.kind_of? Hash
			x.link_data('',@link_data) if @link_data.kind_of? Hash
			x.live_update('',@live_update) if @live_update.kind_of? Hash
			
			
			
			#render chart data
			x.chart_data{
				for aa in @data_array do
					x.row{
						for a in aa do
							x.__send__(get_type(a),a)
						end
					}
				end
			}
			
			x.chart_value_text{
				for aa in @vt_array do
					x.row{
						for a in aa do
							x.__send__(get_type(a),a)
					  end
				  }
			  end
		  }
		}
		
		return a
	end

protected 
	
	def get_type(value)
		case value.class.to_s
			when 'Fixnum'
				return :number
			when 'String'
				return :string
			when 'NilClass'
				return :null
			else
				return :unknown
		end
	end
end