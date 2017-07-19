class Joke

  attr_reader :id, :question, :answer

  def initialize(id:, question:, answer:)
    @id = id
    @question = question
    @answer = answer
  end

end
