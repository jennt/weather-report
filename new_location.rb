require 'pry'
require 'redis'

class Location

  def get_zip
    puts "What zip code would you like to search for weather:\n"
    @zip = gets.chomp
    40.times do print "=" end
    puts
  end

  def display_data()
    @data = HTTParty.get("http://api.wunderground.com/api//2e437d4fdd47f036/geolookup/alerts/astronomy/conditions/currenthurricane/forecast10day/settings/q/#{@zip}.json")

    current_temp = @data['current_observation']['temp_f']
    puts "The current temperature in your area is #{current_temp} degrees."
    40.times do print "=" end
    puts

    alert = @data['response']['alert']

    if alert.nil?
      puts "There are no weather alerts for your area currently."
      40.times do print "=" end
      puts

    else
      puts "Alerts for this zip are: #{alert} "
      40.times do print "=" end
      puts
    end

    moon = @data['moon_phase']["phaseofMoon"]
    puts "The phase of your moon for that area is #{moon}."
    40.times do print "=" end
    puts

    sun_rise_hour = @data['sun_phase']['sunrise']['hour']
    sun_rise_minute = @data['sun_phase']['sunrise']['minute']

    puts "Sunrise is at #{sun_rise_hour}:#{sun_rise_minute}"

    sun_set_hour = @data['sun_phase']['sunset']['hour']
    sun_set_minute = @data['sun_phase']['sunset']['minute']

    puts "Sunset is at #{sun_set_hour}:#{sun_set_minute}"
    40.times do print "=" end
    puts

    @hurricane = @data['currenthurricane'].first['stormInfo']['stormName']

    puts "Current hurricanes: #{@hurricane}"
    40.times do print "=" end
    puts
  end


    def redis_test
      redis = Redis.new
      if redis.get('hurricane').nil?
        redis.set('hurricane', @hurricane)
      end
      puts redis.get('hurricane')
    end

end

# open('http://api.wunderground.com/api/2e437d4fdd47f036/geolookup/conditions/q/IA/Cedar_Rapids.json') do |f|
#   json_string = f.read
#   parsed_json = JSON.parse(json_string)
#   location = parsed_json['location']['city']
#   temp_f = parsed_json['current_observation']['temp_f']
#   print "Current temperature in #{location} is: #{temp_f}\n"
# end

# keys
# ---------
# response
# location
# current_observation X
# forecast
# moon_phase X
# sun_phase X
# query_zone
# alerts X
# currenthurricane
# #
