require "spec_helper"

describe "home/_forecast" do

  let(:fc) { Forecast.get_a_sample_forecast() }

  before {
    view.stub(:forecast).and_return(fc)
    render;
  }

  it "should show location" do
    rendered.should have_content "sample location"
    rendered.should have_content  "8:00 .m."
    rendered.should have_content  = "12:00 p.m."
    rendered.should have_content  = "5:00 p.m."
    rendered.should have_content  = "8:00 p.m."
    rendered.should have_content  = 32
    rendered.should have_content  = 34
    rendered.should have_content  = 34
    rendered.should have_content  = 30
    rendered.should have_content  = 10
    rendered.should have_content  = 15
    rendered.should have_content  = 10
    rendered.should have_content  = 10
    rendered.should have_content  = "rain"
    rendered.should have_content t = "rain"
    rendered.should have_content  = "rain"
    rendered.should have_content  = "snow"
  end
end