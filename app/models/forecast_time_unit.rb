class ForecastTimeUnit
  attr_accessor :time_of_day_text, :temperature, :chance_of_precip, :precip_type_text

  def initialize (options)
    @time_of_day_text = options[:time_of_day_text]
    @tempature = options[:temperature]
    @chance_of_precip = options[:chance_of_precip]
    @precip_type_text = options[:precip_type]
  end
end