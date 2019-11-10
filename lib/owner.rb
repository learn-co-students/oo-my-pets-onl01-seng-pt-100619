class Owner
  attr_accessor :pets
  attr_reader :name, :species
  @@all = []

  def initialize(species)
    @species = species
    @@all << self
  end
end
