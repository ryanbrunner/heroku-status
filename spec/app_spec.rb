require 'spec_helper'

describe HerokuStatus::App do
  let(:app_name) { "forzapanino2" }

  describe "commit" do


    it "should return the current commit" do
      VCR.use_cassette('heroku_release') do
        HerokuStatus::App.get(app_name).commit.should == "d12cf91"
      end
    end

    it "should return the current branches" do
      VCR.use_cassette('heroku_release') do
        HerokuStatus::Git.any_instance.stub(:branches).and_return("master" => "d12cf91")
        HerokuStatus::App.get(app_name).current_branches.should include('master')
      end
    end
  end

  describe "compare_branches" do
    it "should list differences between branches" do
       VCR.use_cassette('heroku_release') do
        HerokuStatus::Git.any_instance.stub(:branches).and_return("master" => "d12cf91")
        HerokuStatus::App.get(app_name).compare_branches.should =~ [
          { branch: 'master', ahead: 3, behind: 2 }
        ]
      end
    end
  end

end
