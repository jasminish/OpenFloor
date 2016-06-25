class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  
  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end

  private
  def question_params
    params.require(:question).permit(:title, :text)
  end

end
