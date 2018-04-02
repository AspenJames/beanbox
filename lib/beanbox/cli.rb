require 'pry'
class Beanbox::CLI
  attr_accessor :scraper

  def initialize
    Beanbox::Coffee.reset!
  end

  def run
    Beanbox::Scraper.new.scrape("https://beanbox.co/coffee/best-sellers")
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
      if input.to_i.between?(1, 10)
        self.list_detail(Beanbox::Coffee.all[input.to_i - 1])
      elsif input == "list"
        self.list_coffees
        self.list_menu
      elsif input == "exit!"
        exit
      else
        puts "I didn't quite get that..."
        self.list_menu
      end
    end
  end


end
