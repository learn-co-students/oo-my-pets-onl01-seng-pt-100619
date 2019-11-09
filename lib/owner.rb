class Owner
  
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def say_species
    return "I am a human."
  end 
  
  def buy_cat(name)
    cat = Cat.new(name,self)
  end 
  
  def buy_dog(name)
    dog = Dog.new(name,self)
  end 
  
  def walk_dogs
    Dog.all.select {|dog| dog.mood = "happy"}
  end 
  
  def feed_cats
    Cat.all.select {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    Cat.all.select {|cat| cat.mood = "nervous"}
    Cat.all.select {|cat| cat.owner = nil}
    Dog.all.select {|dog| dog.mood = "nervous"}
    Dog.all.select {|dog| dog.owner = nil}
  end
  
  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
  def self.all 
    @@all 
  end
  
  def self.count
    Owner.all.count
  end 
  
  def self.reset_all
    @@all.clear
  end 
  
  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end 
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end 
  
end