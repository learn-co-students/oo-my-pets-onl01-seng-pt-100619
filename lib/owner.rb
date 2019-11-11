require 'pry'
class Owner

  attr_reader :name, :species, :cat 
  
  @@all = []
  @@count = 0
  
  
  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
    @@count += 1 
  end  
  
  def self.all
    @@all 
  end
  
  def say_species
    "I am a #{species}."
  end
  
  def self.count
    @@count
  end
  
  def self.reset_all
    @@count = 0
  end
  
  def cats
  Cat.all.select {|cat| cat.owner == self }
  end
  
  def dogs
  Dog.all.select {|dog| dog.owner == self }
  end
  
  def buy_cat(name)
  # binding.pry  
   cat = Cat.new(name, self)
   cat
  end
    
  def buy_dog(name)
    dog = Dog.new(name, self)
    dog
  end
 
  def walk_dogs
    # binding.pry
    self.dogs
    Dog.all.select {|dog| dog.mood = 'happy'}
  end
  
  def feed_cats
    self.cats
    Cat.all.select {|cat| cat.mood = 'happy'}
  end  
  
  def sell_pets
    self.cats
    Cat.all.select {|cat| cat.mood = 'nervous'}
    self.dogs
    Dog.all.select {|dog| dog.mood = 'nervous'}
    self.cats
    Cat.all.select {|cat| cat.owner = nil }
    self.dogs
    Dog.all.select {|dog| dog.owner = nil }
   end  
   
   def list_pets
     self.cats.count
     "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    # self.dogs.count
   end
end 



    