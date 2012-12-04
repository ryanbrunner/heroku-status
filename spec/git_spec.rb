require 'spec_helper'

describe HerokuStatus::Git do
  describe "branches" do
    let(:input) { "buncha stuff from git" }
    it "should list branches" do
      described_class.new.branches.should == {'master' => 'fdebdee'}
    end
  end
end