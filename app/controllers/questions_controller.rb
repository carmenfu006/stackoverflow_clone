class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params.merge(user_id: current_user.id))

    if @question.save
      redirect_to user_path(current_user), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question), notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to user_path(current_user), notice: 'Question was successfully destroyed.'
  end

  def upvote
    current_vote = @question.vote
    if @question.update(vote: current_vote + 1)
      redirect_to question_path(@question), notice: 'This question was successfully upvoted.'
    else
      render :edit
    end
  end

  def downvote
    current_vote = @question.vote
    if @question.update(vote: current_vote - 1)
      redirect_to question_path(@question), notice: 'This question was successfully upvoted.'
    else
      render :edit
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :content, :vote)
    end

end