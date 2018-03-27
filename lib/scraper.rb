require 'nokogiri'
require 'open-uri'
# require 'pry'
# require_relative "coffee"
class Beanbox::Scraper
  attr_accessor :URL_path, :doc, :results

  def initialize(u)
    @URL_path = u
    @results = []
  end

  def scrape
    @doc = Nokogiri::HTML(open(@URL_path))
    #coffees: @doc.css("div.roast-list")
    #name: coffee.css("h2").text
    #roaster: coffee.css("h3.roast-item-roaster a").text
    #price: coffee.css("h4.roast-item-price").text.split("\n")[1]
    @doc.css("div.roast-list").each do |element|
      coffee = Beanbox::Coffee.new
      coffee.name = element.css("h2").text
      coffee.roaster = element.css("h3.roast-item-roaster a").text
      coffee.price = element.css("h4.roast-item-price").text.split("\n")[1]
      self.results << coffee
    end
    # binding.pry
    self.results
  end
end

# Beanbox::Scraper.new("https://beanbox.co/coffee").scrape
