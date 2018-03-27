require "spec_helper"
require "scraper"
require "coffee"

describe Beanbox::Scraper do
  before do
    @scraper = Beanbox::Scraper.new("https://beanbox.co/coffee")

  end

  it "should have a URL_path on itialization" do
    expect(@scraper.URL_path).to eql("https://beanbox.co/coffee")
  end

  describe "#scrape" do
    before do
      @scraper.scrape
    end
    it "should scrape the URL_path into doc" do
      expect(@scraper.doc).to be_instance_of(Nokogiri::HTML::Document)
    end

    it "should store results in self.results" do
      expect(@scraper.results).to be_instance_of(Array)
    end

    it "should return an array of Coffees" do
      expect(@scraper.results).to be_instance_of(Array)
      expect(@scraper.results.first).to be_instance_of(Beanbox::Coffee)
    end
  end

end
