module JsonRenderer

    def json_response(message, status, data)
      render json: { message: message, rstatus: status, data: place_null(data) }
    end
  
    def render_json(json)
      callback = params[:callback]
      response = begin
        if callback
          "#{callback}(#{json});"
        else
          json
        end
      end
    render({:content_type => 'application/javascript', :plain => response})
    end
  
    def place_null(data)
      if data.is_a?(Hash)
        data.each {|k,v| data[k] = "" if v == nil}
      elsif data.is_a?(Array)
        data.each do |data_value|
          place_null(data_value)
        end
      else
        data = "" if data == nil
      end
    end
  
  end
  