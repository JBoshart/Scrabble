require_relative './spec_helper'
require_relative '../lib/player'

TEST_CASES = ["word", "butt", "fart", "red"]
WIN_CASE = ["cazique", "mezquit"]
WINNING = 100


describe Player do
  it "Does the Player Class exist test?" do
    Player.wont_be_nil
  end

  describe "Player#new(name)" do
    it "Does the class initialize with a name" do
      Player.new(name).wont_be_nil
    end
  end

  describe "#plays" do
    test_player = Player.new(name)
    it "Does it contain an array" do
      test_player.plays.must_be_kind_of Array
    end
  end

  describe "#play(word)" do

    test_player = Player.new(name)

    # TEST_CASES.each do |played_word|
      it "Does it add the played word?" do
        test_player.play("word")
        test_player.plays.must_equal(["word"])
      end
    # end
  end

  describe "#play(word)" do

    test_player = Player.new(name)

    TEST_CASES.each do |played_word|
    it "Does it return the score of the word" do
        test_player.play(played_word).must_equal(Scoring.score(played_word))
      end
    end
  end

  describe "#total_score" do

    test_player = Player.new(name)

    it "Does it return the total score" do
      TEST_CASES.each do |word|
        test_player.play(word)
      end
      test_player.total_score.must_equal(25)
    end
  end

  describe "#won?" do

    test_player = Player.new(name)

    it "Does it return true if the player won?" do
      WIN_CASE.each do |word|
        test_player.play(word)
      end
      assert test_player.won? == true
    end
  end

  describe "#highest_scoring_word" do

    test_player = Player.new(name)

    it "Does it return the highest scoring WORD" do
      TEST_CASES.each do |word|
        test_player.play(word)
      end
      test_player.highest_scoring_word.must_equal("word")
    end
  end

  describe "#highest_word_score" do

    test_player = Player.new(name)

    it "Does it return the highest word SCORE" do
      TEST_CASES.each do |word|
        test_player.play(word)
      end
      test_player.highest_word_score.must_equal(8)
    end
  end
end
