class CommentsController < ApplicationController
  def index
    @answer = Answer.find(params[:answer_id])
    @question = Question.find(params[:question_id])
    @comment = Comment.new
    @comments = @answer.comments.all
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.new(comment_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @comment.save
        # # turbo frame at comments/index.html.erb
        format.html { redirect_to question_answer_comments_path(@question, @answer), notice: 'Comment was successfully created.' }
        # format.html { redirect_to question_answer_comment_path(@answer, @comment), notice: 'Comment was successfully created.' }
        # format.html redirect_to question_path(@question), notice: 'Comment was successfully created.'
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@comment, partial: 'comments/comment_form', locals: { @comment => @comment, @question => @question, @answer => @answer })}
        format.html { redirect_to question_path(@question), alert: 'There was an error.' }
      end
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:answer_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to question_answer_comments_path(@question, @answer), notice: 'Comment was successfully created.' }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :vote)
    end
end