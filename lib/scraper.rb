require 'nokogiri'
require 'open-uri'
class Beanbox::Scraper
  doc = Nokogiri::HTML(open("https://beanbox.co/coffee"))
  binding.pry
end
