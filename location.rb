class Location

#url = "http://api.wunderground.com/api/#{key}/alerts/astronomy/conditions/currenthurricane/forecast10day/settings/q/#{zipcode}.json"


def initialize(data, url)
  @data = data
  @url = url
end

def show_conditions
  open(@url) do |f|
    json_string = f.read
    parsed_json = JSON.parse(json_string)
    location = parsed_json['location']['city']
    temp_f = parsed_json['current_observation']['temp_f']
    print "Current temperature in #{location} is: #{temp_f}\n"
  end
end
  # conditions = get_json(@url)
  # puts JSON.pretty_generate(conditions)


# def show_alerts
#   open(@url) do |f|
#     json_string = f.read
#     parsed_json = JSON.parse(json_string)
#     location = parsed_json['location']['city']
#     description = parsed_json['current_observation']['message']
#     print "Current alert in #{location} is: #{description}\n"
#   end
# end

# def show_astronomy
#     open(@url) do |f|
#       json_string = f.read
#       parsed_json = JSON.parse(json_string)
#       location = parsed_json['location']['city']
#       temp_f = parsed_json['current_observation']['temp_f']
#       print "Current temperature in #{location} is: #{temp_f}\n"
#     end
#   end

def show_hurricane
 # puts "hurricanes!"
 # puts "-------------------------------------------------------------------"
 # hurricanes = get_json('http://api.wunderground.com/api/2e437d4fdd47f036/currenthurricane/view.json')
 # puts JSON.pretty_generate(hurricanes)
end

def show_forecast_10_day
  puts "forecast!"
end

def get_json(url)
  HTTParty.get(url).parsed_response
end


# hurricanes = get_json('http://api.wunderground.com/api/2e437d4fdd47f036/currenthurricane/view.json')
# puts JSON.pretty_generate(hurricanes)
end
