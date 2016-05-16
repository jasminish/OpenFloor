require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup
    @question = Question.new
  end

  test "the truth" do
    assert @question.valid?, @question.errors.full_messages
  end
end
