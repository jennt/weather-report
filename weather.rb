require 'httparty'
require 'optparse'
require 'json'
require 'open-uri'

require_relative 'location'
require_relative 'info'

def parse_options
  options = {}

  OptionParser.new do |opts|
    opts.on('-z', '--zipcode zip') do |zip|
      options[:zipcode] = zip
    end
  end.parse!

  options

end

def call_api
  options = parse_options

  zipcode = options[:zipcode]

  key = '2e437d4fdd47f036'.to_i

  url = "http://api.wunderground.com/api//2e437d4fdd47f036/geolookup/alerts/astronomy/conditions/currenthurricane/forecast10day/settings/q/#{zipcode}.json"
      # ('http://api.wunderground.com/api/2e437d4fdd47f036/geolookup/conditions/q/IA/Cedar_Rapids.json')

  data = HTTParty.get(url).parsed_response

  breakdown_location(data, url)

end

def breakdown_location(data, url)
  location = Location.new(data, url)

  location.show_conditions
  # location.show_alerts
  # location.show_astronomy
  location.show_hurricane
  location.show_forecast_10_day
end



def main

  call_api

end


main if __FILE__ == $PROGRAM_NAME


# require 'open-uri'
# require 'json'
# open('http://api.wunderground.com/api/2e437d4fdd47f036/geolookup/conditions/q/IA/Cedar_Rapids.json') do |f|
#   json_string = f.read
#   parsed_json = JSON.parse(json_string)
#   location = parsed_json['location']['city']
#   temp_f = parsed_json['current_observation']['temp_f']
#   print "Current temperature in #{location} is: #{temp_f}\n"
# end
#
# puts "Enter you zip code: "
# zip = gets.chomp
#
# open("http://api.wunderground.com/api/2e437d4fdd47f036/geolookup/q/#{zip}.json") do |f|
#   json_string = f.read
#   parsed_json = JSON.parse(json_string)
#   location = parsed_json['location']['city']
#   temp_f = parsed_json['current_observation']['temp_f']
#   print "Current temperature in #{location} is: #{temp_f}\n"
# end


# http://api.wunderground.com/api/2e437d4fdd47f036/geolookup/q/94107.json



# def get_json(url)
#   HTTParty.get(url).parsed_response
# end
#
# forecast10day = get_json('http://api.wunderground.com/api/2e437d4fdd47f036/forecast10day/q/CA/San_Francisco.json')
# puts JSON.pretty_generate(forecast10day)
#
# hurricanes = get_json('http://api.wunderground.com/api/2e437d4fdd47f036/currenthurricane/view.json')
# puts JSON.pretty_generate(hurricanes)
#
# conditions = get_json('http://api.wunderground.com/api/2e437d4fdd47f036/conditions/q/CA/San_Francisco.json')
# puts JSON.pretty_generate(conditions)
#
# astronomy = get_json('http://api.wunderground.com/api/2e437d4fdd47f036/astronomy/q/Australia/Sydney.json')
# puts JSON.pretty_generate(astronomy)
#
# alerts = get_json('http://api.wunderground.com/api/2e437d4fdd47f036/alerts/q/IA/Des_Moines.json')
# puts JSON.pretty_generate(alerts)
