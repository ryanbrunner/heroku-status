require 'spec_helper'

describe HerokuStatus::App do
  describe "commit" do
    let(:app_name) { "forzapanino2" }

    it "should return the current commit" do
      VCR.use_cassette('heroku_release') do
        HerokuStatus::App.get(app_name).commit.should == "d12cf91"
      end
    end

    it "should return the current branches" do
      VCR.use_cassette('heroku_release') do
        HerokuStatus::App.get(app_name).current_branches.should include('master')
      end
    end
  end

end
