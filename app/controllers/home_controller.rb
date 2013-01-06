class HomeController < ApplicationController
  def index
    @forecast = Forecast.get_a_sample_forecast()
  end
end
