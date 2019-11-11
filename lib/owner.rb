require "pry"
class Owner

  attr_reader :species, :name
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @pets = {:dogs => [], :cats => []}
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
    cat
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
    dog
  end

  def walk_dogs
    Dog.all.collect do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.collect do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    Dog.all.collect do |dog|
      dog.mood = "nervous"
    end
    Cat.all.collect do |cat|
      cat.mood = "nervous"
    end
    Dog.all.collect do |dog|
      dog.owner = nil
    end
    Cat.all.collect do |cat|
      cat.owner = nil
    end
  end

  def list_pets
    binding.pry
    "I have #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end
end
