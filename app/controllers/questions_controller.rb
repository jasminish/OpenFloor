class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]

  def new
    @question = Question.new
  end

  def edit
      @question = Question.find(params[:id])
      if @question.original_author != current_user
        flash[:danger] = "You are not the author!"
        redirect_to @question
      end
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
    if @question.original_author == current_user
      @question.destroy
    else
      flash[:danger] = "You are not the author!"
    end
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
    params.require(:question).permit(:title, :text).merge(original_author: current_user)
  end

end
