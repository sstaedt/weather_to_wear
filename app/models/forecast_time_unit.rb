class ForecastTimeUnit
  attr_accessor :date_and_time, :time_of_day_text, :temperature, :chance_of_precip, :precip_type_text

  def initialize (options)
    @date_and_time = options[:date_and_time]
    @day_of_week_text = options[:day_of_week_text]
    @time_of_day_text = @date_and_time.strftime("%l:%M %p")
    @tempature = options[:temperature]
    @chance_of_precip = options[:chance_of_precip]
    @precip_type_text = options[:precip_type]
  end
end