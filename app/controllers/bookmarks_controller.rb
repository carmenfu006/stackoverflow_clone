class BookmarksController < ApplicationController
  
  # def create
  #   question = Question.find(params[:question])
  #   user = User.find(params[:user])
  #   bookmark = Bookmark.create(user_id: user.id, question_id: question.id)

  #   if bookmark.save
  #     redirect_to question_path(question), notice: 'Question was successfully bookmarked.'
  #   else
  #     redirect_to question_path(question), notice: 'Please try again. There was an error.'
  #   end
  # end

  def create
    question = Question.find(params[:bookmark][:question_id])
    bookmark = Bookmark.create(bookmark_params)

    if bookmark.save
      redirect_to question_path(question), notice: 'Question was successfully bookmarked.'
    else
      redirect_to question_path(question), notice: 'Please try again. There was an error.'
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    bookmark.destroy
    
    redirect_to question_path(question), notice: 'Bookmark was successfully removed.'
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(:user_id, :question_id)
    end
end