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

  it "should scrape the URL_path into doc" do
    expect(@scraper.doc).to eql(Nokogiri::HTML(open(@scraper.URL_path)))
  end

  describe ".scrape" do
    it "should return an array of Coffees" do
      expect(Beanbox::Scraper.scrape).to be_instance_of(Array)
      expect(Beanbox::Scraper.scrape.first).to be_instance_of(Beanbox::Coffee)
    end
  end

end
