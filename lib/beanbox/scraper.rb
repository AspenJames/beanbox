require 'nokogiri'
require 'open-uri'
require 'pry'

class Beanbox::Scraper

  def scrape(url)
    doc = Nokogiri::HTML(open(url))
    doc.css("div.ten.columns.center.results").first.css("div.roast-list").each_with_index do |element, i|
      if ((0..9).to_a.include?(i))
        name = element.css("h2").text
        # This next line normalizes the name, which is returned in all caps
        name = name.split(" ").collect{|n| n.capitalize}.join(" ")
        roaster = element.css("h3.roast-item-roaster a").text
        price = element.css("h4.roast-item-price").text.split("\n")[1]
        # url = element.css("a").attribute("href").value
        detail = Nokogiri::HTML(open(element.css("a").attribute("href").value))
        description = detail.css("div.bb p").text.strip
        type = detail.css("div.centered-mobile span.rt a").first.text
        roast_level = detail.css("div.centered-mobile span.rt a").first.text
        Beanbox::Coffee.new(name, roaster, price, description, type, roast_level)
      end
    end
  end
end
