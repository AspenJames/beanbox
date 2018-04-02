class Beanbox::Coffee
  attr_accessor :name, :roaster, :price, :type, :roast_level, :description
  @@all = []

  def initialize(name, roaster, price, description, type, roast_level)
    @name = name
    @roaster = roaster
    @price = price
    @description = description
    @type = type
    @roast_level = roast_level
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset!
    @@all = []
  end
end
