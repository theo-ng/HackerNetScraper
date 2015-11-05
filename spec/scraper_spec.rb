require_relative 'spec_helper.rb'

describe Scraper do

  describe "#main" do

    it "should return an error if file/page not found" do
      expect { Scraper.new.main("http:asdasdasdasd") }.to raise_error
    end

  end

end