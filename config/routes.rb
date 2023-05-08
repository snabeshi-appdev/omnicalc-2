Rails.application.routes.draw do

  get("/add", {:controller => "application", :action => "blank_add"})
  get("/subtract", {:controller => "application", :action => "blank_subtract"})
  get("/multiply", {:controller => "application", :action => "blank_multiply"})
  get("/divide", {:controller => "application", :action => "blank_divide"})

  get("/wizard_add", {:controller => "application", :action => "calculate_add"})
  get("/wizard_subtract", {:controller => "application", :action => "calculate_subtract"})
  get("/wizard_multiply", {:controller => "application", :action => "calculate_multiply"})
  get("/wizard_divide", {:controller => "application", :action => "calculate_divide"})
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
