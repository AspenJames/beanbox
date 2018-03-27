require "spec_helper.rb"
require "coffee"

describe Beanbox::Coffee do

  before do
    @coffee = Beanbox::Coffee.new
    @coffee.name = "Rwanda"
    @coffee.roaster = "Kuma"
    @coffee.price = 19
  end
  it "should have a name" do
    expect(@coffee.name).to eql("Rwanda")
  end

  it "should have a roaster" do
    expect(@coffee.roaster).to eql("Kuma")
  end

  it "should have a price" do
    expect(@coffee.price).to eql(19)
  end

  it "should add itself to @@all upon initialization" do
    expect(Beanbox::Coffee.all).to include(@coffee)
  end

  describe ".reset!" do
    it "should clear @@all" do
      Beanbox::Coffee.reset!
      expect(Beanbox::Coffee.all).to eql([])
    end
  end

end
