class Beanbox::CLI

  def initialize
    Beanbox::Coffee.reset!
  end
  def run
    self.welcome_message
    Beanbox::Scraper.new("https://beanbox.co/coffee")
    self.list_coffees
    # self.list_menu #Update later to expand functionality
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
