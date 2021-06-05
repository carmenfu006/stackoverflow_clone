class AnswersController < ApplicationController

  def create
    question = Question.find(params[:question_id])
    answer = question.answers.new(answer_params.merge(user_id: current_user.id))

    if answer.save
      redirect_to question_path(question), notice: 'This question was successfully upvoted.'
    else
      redirect_to question_path(question), alert: 'There was an error. Please try again.'
    end
  end

  def destroy
    question = Question.find(params[:question_id])
    answer = Answer.find(params[:id])
    answer.destroy
    redirect_to question_path(question), notice: 'This answer was successfully destroyed.'
  end

  def vote
    @answer = Answer.find(params[:answer_id])
    current_vote = @answer.vote

    if params[:voting] == 'upvote'
      @answer.update(vote: current_vote + 1)
    else
      @answer.update(vote: current_vote - 1)
    end

    respond_to do |format|
      # points to vote.js.erb
      format.js
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:body, :vote)
    end

end