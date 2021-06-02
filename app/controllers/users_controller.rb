class UsersController < ApplicationController

  def show
    @questions = current_user.questions.all
  end

end