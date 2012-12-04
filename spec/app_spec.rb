require 'spec_helper'

describe HerokuStatus::App do
  describe "commit" do
    let(:app_name) { "test_app" }

    it "should return the current commit" do
      HerokuStatus::App.get(app_name).commit.should == "TODO: Current commit"
    end
  end

end