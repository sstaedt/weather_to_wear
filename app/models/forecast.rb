class Forecast
  attr_accessor :location_name, :time_units

  def initialize (options)
    @location_name = options[:location_name]
    @time_units = options[:time_units]
  end

  def self.get_a_sample_forecast
    Forecast.new(
    location_name: "sample location",
    time_units: [ ForecastTimeUnit.new({ time_of_day_text: "8:00 a.m.",
                                           temperature: "32",
                                           chance_of_precip: "10",
                                           precip_type_text: "rain"}),
                    ForecastTimeUnit.new({ time_of_day_text: "12:00 p.m.",
                                           temperature: "34",
                                           chance_of_precip: "15",
                                           precip_type_text: "rain"}),
                    ForecastTimeUnit.new({ time_of_day_text: "5:00 p.m.",
                                           temperature: "34",
                                           chance_of_precip: "10",
                                           precip_type_text: "rain"}),
                    ForecastTimeUnit.new({ time_of_day_text: "8:00 p.m.",
                                           temperature: "30",
                                           chance_of_precip: "10",
                                           precip_type_text: "snow"})])
  end
end
