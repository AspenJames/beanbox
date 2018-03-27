class Beanbox::CLI
  def run
    self.welcome_message
    scraper = Beanbox::Scraper.new
  end

  def welcome_message
    puts "Hello! Today's top selling coffees are: "
  end
end
