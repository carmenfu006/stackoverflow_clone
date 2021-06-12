class UsersController < ApplicationController

  def show
    @questions = current_user.questions.all
    @bookmarks = current_user.bookmarks.all
    @search = Search.new
  end

end