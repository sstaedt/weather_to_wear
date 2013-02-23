class Forecast
  require "json"
  attr_accessor :location_name, :time_units

  def initialize (options)
    @location_name = options[:location_name]
    @time_units = options[:time_units]

    blah = read_sample_file()
    parse_json_forecast(blah)
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

  private
  def parse_json_forecast(forecast_json)
    #http://www.wunderground.com/weather/api/d/docs?d=resources/phrase-glossary
    parsed_forecast = JSON.parse(forecast_json)
    parsed_forecast["hourly_forecast"].each do |hf|
      f_time = hf["FCTTIME"]
      day_of_week = f_time["weekday_name"]
      date_and_time_string = "#{f_time["year"]}/#{f_time["mon"]}/#{f_time["mday"]} #{f_time["hour"]}:#{f_time["min"]} #{f_time["ampm"]}"
      temp = {english: hf["temp"]["english"], metric: hf["temp"]["metric"]}
      cop = ""
      precip_type = ""
      hf_unit = ForecastTimeUnit.new({date_and_time:date_and_time_string.to_datetime,
                                      day_of_week_text:day_of_week,
                                      temperature: temp,
                                      chance_of_precip: cop,
                                      precip_type_text: precip_type})
      puts hf_unit.time_of_day_text
    end
  end
  def read_sample_file
    config_path = File.expand_path("../sample_forecast.txt", __FILE__)
    File.open(config_path, "r") { |infile| infile.read }
  end
end
