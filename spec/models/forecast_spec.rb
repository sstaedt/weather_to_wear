require 'spec_helper'


describe "Forecast" do
  let(:sample) {Forecast.get_a_sample_forecast()}

  context "#fill_in_sample_forecast" do

    it "gives sample data" do
      sample.location_name.should == "sample location"
      sample.time_units[0].time_of_day_text = "8:00 a.m."
      sample.time_units[1].time_of_day_text = "12:00 p.m."
      sample.time_units[2].time_of_day_text = "5:00 p.m."
      sample.time_units[3].time_of_day_text = "8:00 p.m."
      sample.time_units[0].temperature = 32
      sample.time_units[1].temperature = 34
      sample.time_units[2].temperature = 34
      sample.time_units[3].temperature = 30
      sample.time_units[0].chance_of_precip = 10
      sample.time_units[1].chance_of_precip = 15
      sample.time_units[2].chance_of_precip = 10
      sample.time_units[3].chance_of_precip = 10
      sample.time_units[0].precip_type_text = "rain"
      sample.time_units[1].precip_type_text = "rain"
      sample.time_units[2].precip_type_text = "rain"
      sample.time_units[3].precip_type_text = "snow"
    end
  end
end
