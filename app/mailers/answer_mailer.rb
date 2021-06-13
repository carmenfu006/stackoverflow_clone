class AnswerMailer < ApplicationMailer
  def new_answer_notification(question, answer)
    @question = question
    @answer = answer
    @user = question.user

    mail(to: @user.email, subject: "New answer notification")
  end
end