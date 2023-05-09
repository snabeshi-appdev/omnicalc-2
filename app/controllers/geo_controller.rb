class GeoController < ApplicationController

  def blank_street
    render({:template => "geo_templates/street_form.html.erb"})
  end

  def blank_weather
    render({:template => "geo_templates/weather_form.html.erb"})
  end

  def lookup_coordinates
    @street_address = params.fetch("user_street_address")
    gmaps_token = ENV.fetch("GMAPS_KEY")
    gmaps_api_endpoint = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@street_address}&key=#{gmaps_token}"
    
    require "open-uri"
    raw_response_g = URI.open(gmaps_api_endpoint).read

    require "json"
    parsed_response = JSON.parse(raw_response_g)
    results_array = parsed_response.fetch("results")
    first_result = results_array.at(0)

    geo = first_result.fetch("geometry")
    location = geo.fetch("location")

    @latitude = location.fetch("lat")
    @longitude = location.fetch("lng")
    render({:template => "geo_templates/street_results.html.erb"})
  end

  def lookup_weather
    @latitude = params.fetch("user_latitude").to_f
    @longitude = params.fetch("user_longitude").to_f

    pirate_weather_token = ENV.fetch("PIRATE_WEATHER_KEY")
    pirate_weather_endpoint = "https://api.pirateweather.net/forecast/#{pirate_weather_token}/#{@latitude},#{@longitude}"

    require "open-uri"
    raw_response_w = URI.open(pirate_weather_endpoint).read

    require "json"
    parsed_response_w =JSON.parse(raw_response_w)

    currently_array = parsed_response_w.fetch("currently")

    @temperature = currently_array.fetch("temperature")
    @summary = currently_array.fetch("summary")

    minutely_array = parsed_response_w.fetch("minutely")
    @next_sixty_minutes = minutely_array.fetch("summary")

    hourly_array = parsed_response_w.fetch("hourly")
    @next_several_hours = hourly_array.fetch("summary")

    daily_array = parsed_response_w.fetch("daily")
    @next_several_days = daily_array.fetch("summary")
    render({:template => "geo_templates/weather_results.html.erb"})
  end


end
