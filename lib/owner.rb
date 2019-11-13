require 'pry'

class Owner 
  attr_reader :name, :species
  
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    save
    # binding.pry
  end
  
  
  def say_species
    "I am a #{self.species}."
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.count
    self.all.count
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats
    Cat.all.select{|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    new_cat = Cat.new(name,self)
    # binding.pry
  end
  
  def buy_dog(name)
    new_dog = Dog.new(name,self)
  end
  
  def walk_dogs
    Dog.all.select{|dog| dog.mood != "happy" ? dog.mood ="happy" : dog.mood}
  end
  
  def feed_cats
    Cat.all.select{|cat| cat.mood != "happy" ? cat.mood = "happy" : cat.mood}
  end
  
  def sell_pets
    pets = self.cats + self.dogs
    pets.each{|pet| 
       pet.owner = nil 
       pet.mood = "nervous"
    }
  end
 
 def list_pets
   "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
 end
end