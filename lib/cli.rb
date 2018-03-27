class Beanbox::CLI

  def initialize
    Beanbox::Coffee.reset!
  end

  def run
    input = nil
    until input == "exit!"
      self.welcome_message
      Beanbox::Scraper.new("https://beanbox.co/coffee").scrape
      self.list_coffees
      # self.list_menu #Update later to expand functionality
      input = "exit!" # exits loop - remove when list_menu is defined
    end
  end

  def welcome_message
    puts "Hello! Today's top selling coffees are: "
  end

  def list_coffees
    Beanbox::Coffee.all.each_with_index do |c, i|
      puts "#{i + 1}. #{c.name} roasted by #{c.roaster} at #{c.price}"
      puts
    end
  end

  # def list_menu
  #  #Update later to expand functionality
  # end


end
