Rails.application.routes.draw do
  namespace :api do
    get "/country-wise-accidents", to: "accidents#country_wise_accidents"    
    get "/month-wise-accidents-in-us", to: "accidents#month_wise_accidents_in_us" 
    get "/injury-severity-count", to: "accidents#injury_severity_count"
    get "/top-ten-companies", to: "accidents#top_ten_companies"
    get "/accidents-by-state-in-us", to: "accidents#accidents_per_state_in_us"
  end
end
