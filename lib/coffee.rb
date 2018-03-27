class Beanbox::Coffee
  attr_accessor :name, :roaster, :price
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset!
    @@all = []
  end
end
