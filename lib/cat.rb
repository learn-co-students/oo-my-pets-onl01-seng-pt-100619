class Cat
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []
  @owner = "Hermione"
  @name = "Mr. Whiskers"
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  def name
    @name.dup.freeze
  end

  def self.all
    @@all
  end
end
