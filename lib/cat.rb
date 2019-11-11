require_relative "./owner.rb"
class Cat < Owner
  attr_accessor :owner, :mood
  attr_reader :name
end
