require 'pry'
class Beanbox::CLI
  attr_accessor :scraper

  def initialize
    Beanbox::Coffee.reset!
  end

  def run
    @scraper = Beanbox::Scraper.new("https://beanbox.co/coffee/best-sellers")
    @scraper.scrape
    self.list_coffees
    self.list_menu
  end

  def list_coffees
    puts "Hello! Today's top selling coffees are: "
    Beanbox::Coffee.all.each_with_index do |c, i|
      puts "#{i + 1}. #{c.name} roasted by #{c.roaster} at #{c.price}"
      puts
    end
  end

  def list_detail(coffee)
    @scraper.scrape_detail(coffee)
    puts
    puts "#{coffee.name} roasted by #{coffee.roaster}"
    puts "Type: #{coffee.type}"
    puts "Roast level: #{coffee.roast_level}"
    puts "Price: #{coffee.price}"
    puts
    puts "#{coffee.description}"
    puts
    puts 'Enter "list" to return the menu or "exit!"'
    input = nil
    until input == "exit!"
      input = gets.chomp
      if input == "list"
        self.list_coffees
        self.list_menu
        break
      elsif input == "exit!"
        exit
      else
        puts "I didn't quite get that..."
        self.list_menu
      end
    end
  end

  def list_menu
    puts 'Select a number for more information, "exit!", or "list" to return to the menu'
    input = nil
    until input == "exit!"
      input = gets.chomp
      case input
      when "1"
        self.list_detail(Beanbox::Coffee.all[0])
      when "2"
        self.list_detail(Beanbox::Coffee.all[1])
      when "3"
        self.list_detail(Beanbox::Coffee.all[2])
      when "4"
        self.list_detail(Beanbox::Coffee.all[3])
      when "5"
        self.list_detail(Beanbox::Coffee.all[4])
      when "6"
        self.list_detail(Beanbox::Coffee.all[5])
      when "7"
        self.list_detail(Beanbox::Coffee.all[6])
      when "8"
        self.list_detail(Beanbox::Coffee.all[7])
      when "9"
        self.list_detail(Beanbox::Coffee.all[8])
      when "10"
        self.list_detail(Beanbox::Coffee.all[9])
      when "list"
        self.list_coffees
        self.list_menu
      when "exit!"
        exit
      else
        puts "I didn't quite get that..."
        self.list_menu
      end
    end
  end


end
