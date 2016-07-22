class AnswersController < ApplicationController
  before_action :logged_in_user, only: [:destroy]

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.original_author == current_user
      @answer.destroy
    else
      flash[:danger] = "You are not the author!"
    end
    redirect_to question_path(@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:author, :body, :parent_answer_id).merge(original_author: current_user)
  end
end
