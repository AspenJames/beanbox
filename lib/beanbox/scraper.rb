require 'nokogiri'
require 'open-uri'
require 'pry'

class Beanbox::Scraper
  attr_accessor :URL_path, :doc, :results, :detail

  def initialize(u)
    @URL_path = u
    @results = []
  end


  def scrape
    @doc = Nokogiri::HTML(open(@URL_path))
    @doc.css("div.ten.columns.center.results").first.css("div.roast-list").each_with_index do |element, i|
      if ((0..9).to_a.include?(i))
        coffee = Beanbox::Coffee.new
        coffee.name = element.css("h2").text
        # This next line normalizes the name, which is returned in all caps
        coffee.name = coffee.name.split(" ").collect{|n| n.capitalize}.join(" ")
        coffee.roaster = element.css("h3.roast-item-roaster a").text
        coffee.price = element.css("h4.roast-item-price").text.split("\n")[1]
        coffee.url = element.css("a").attribute("href").value
        # binding.pry
        self.results << coffee # add each coffee to @results
      end
    end

    self.results
  end


  # def scrape
  #   @doc = Nokogiri::HTML(open(@URL_path))
  #   @doc.css("div.twelve.columns.center.pad-top").first.css("div.roast-list").each do |element|
  #     coffee = Beanbox::Coffee.new
  #     coffee.name = element.css("h2").text
  #     # This next line normalizes the name, which is returned in all caps
  #     coffee.name = coffee.name.split(" ").collect{|n| n.capitalize}.join(" ")
  #     coffee.roaster = element.css("h3.roast-item-roaster a").text
  #     coffee.price = element.css("h4.roast-item-price").text.split("\n")[1]
  #     coffee.url = element.css("a").attribute("href").value
  #     self.results << coffee # add each coffee to @results
  #   end
  #
  #   self.results
  # end


  def scrape_detail(coffee)
    @detail = Nokogiri::HTML(open(coffee.url))
    # binding.pry
    coffee.description = @detail.css("div.bb p").text.strip
    coffee.type = @detail.css("div.centered-mobile span.rt a").first.text
    coffee.roast_level = @detail.css("div.centered-mobile span.rt a").first.text
  end
end
