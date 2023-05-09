class GeoController < ApplicationController

  def blank_street
    render({:template => "geo_templates/street_form.html.erb"})
  end

  def lookup_coordinates
    @street_address = params.fetch("user_street_address")
    gmaps_token = ENV.fetch("GMAPS_KEY")
    gmaps_api_endpoint = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@street_address}&key=#{gmaps_token}"
    
    require "open-uri"

    raw_response = URI.open(gmaps_api_endpoint).read

    require "json"

    parsed_response = JSON.parse(raw_response)
    results_array = parsed_response.fetch("results")
    first_result = results_array.at(0)

    geo = first_result.fetch("geometry")
    location = geo.fetch("location")

    @latitude = location.fetch("lat")
    @longitude = location.fetch("lng")
    render({:template => "geo_templates/street_results.html.erb"})
  end


end
