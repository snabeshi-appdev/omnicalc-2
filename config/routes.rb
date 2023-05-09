Rails.application.routes.draw do

  # for Math controller

  get("/add", {:controller => "math", :action => "blank_add"})
  get("/subtract", {:controller => "math", :action => "blank_subtract"})
  get("/multiply", {:controller => "math", :action => "blank_multiply"})
  get("/divide", {:controller => "math", :action => "blank_divide"})

  get("/wizard_add", {:controller => "math", :action => "calculate_add"})
  get("/wizard_subtract", {:controller => "math", :action => "calculate_subtract"})
  get("/wizard_multiply", {:controller => "math", :action => "calculate_multiply"})
  get("/wizard_divide", {:controller => "math", :action => "calculate_divide"})

  # for geo controller
  get("/street_to_coords/new", {:controller => "geo", :action => "blank_street"})
  get("/coords_to_weather/new", {:controller => "geo", :action => "blank_weather"})

  get("/street_to_coords/results", {:controller => "geo", :action => "lookup_coordinates"})
  get("/coords_to_weather/results", {:controller => "geo", :action => "lookup_weather"})

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
