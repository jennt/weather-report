require 'httparty'
require 'optparse'
require 'json'
require 'redis'
require_relative 'new_location.rb'
require 'pry'

def main

  location = Location.new

  location.get_zip

  location.display_data

  location.redis_test

  # puts redis.get('hurricane')

end

main if __FILE__ == $PROGRAM_NAME
