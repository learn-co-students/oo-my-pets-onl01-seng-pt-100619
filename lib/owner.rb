require 'pry'

class Owner 
  attr_reader :name, :species
  
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    # binding.pry
  end
  
  
  def say_species
    "I am a #{self.species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats
    Cat.all.select{|cat| cat.owner = self}
  end
  
  
end