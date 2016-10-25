# require 'httparty'
# require 'optparse'
# require 'json'
# require 'open-uri'
#
# require_relative 'location'
# require_relative 'info'
#
# def parse_options
#   options = {}
#
#   OptionParser.new do |opts|
#     opts.on('-z', '--zipcode zip') do |zip|
#       options[:zipcode] = zip
#     end
#   end.parse!
#
#   options
#
# end
#
# def call_api
#   options = parse_options
#
#   zipcode = options[:zipcode]
#
#   key = '2e437d4fdd47f036'.to_i
#
#   url = "http://api.wunderground.com/api//2e437d4fdd47f036/geolookup/alerts/astronomy/conditions/currenthurricane/forecast10day/settings/q/#{zipcode}.json"
#       # ('http://api.wunderground.com/api/2e437d4fdd47f036/geolookup/conditions/q/IA/Cedar_Rapids.json')
#
#   data = HTTParty.get(url).parsed_response
#
#   breakdown_location(data, url)
#
# end
#
# def breakdown_location(data, url)
#   location = Location.new(data, url)
#
#   location.show_conditions
#   location.show_alerts
#   # location.show_astronomy
#   # location.show_hurricane
#   # location.show_forecast_10_day
# end
#
#
#
# def main
#
#   call_api
#
# end
#
#
# main if __FILE__ == $PROGRAM_NAME
