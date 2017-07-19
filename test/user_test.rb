require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'
require 'pry'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_it_can_learn_a_joke
    sal = User.new("Sal")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})

    assert_equal 0, sal.jokes.count

    sal.learn(joke)

    assert_equal 1, sal.jokes.count

  end

  def test_it_can_tell_a_joke
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal.learn(joke)

    assert_equal 0, ali.jokes.count

    sal.tell(ali, 0)

    assert_equal 1, ali.jokes.count
  end

  def test_it_can_perform_a_routine
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})

    ilana = User.new("Ilana")
    josh = User.new("Josh")

    ilana.learn(joke_1)
    ilana.learn(joke_2)

    assert_equal 0, josh.jokes.count

    ilana.perform_routine_for(josh)

    assert_equal 2, josh.jokes.count
  end

  def test_it_can_learn_a_routine

    casey = User.new("Casey")

    casey.learn_routine('./jokes.csv')
    assert_equal 100, casey.jokes.count
  end


end
