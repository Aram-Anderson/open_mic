require './lib/joke'

class User

  attr_accessor :jokes
  attr_reader :name

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(listener, joke)
    listener.jokes << @jokes[joke]
  end

  def perform_routine_for(listener)
    listener.jokes = @jokes
  end

end
