class GeoController < ApplicationController

  def blank_street
    render({:template => "geo_templates/street_form.html.erb"})
  end

  def lookup_coordinates
    @street_address = params.fetch("user_street_address")
    xxx
    @lattitude = params.fetch("user_street_address")
    @longitude = params.fetch("user_street_address")
    render({:template => "geo_templates/street_results.html.erb"})
  end


end
