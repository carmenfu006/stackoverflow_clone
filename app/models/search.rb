class Search < ApplicationRecord
  def search_question
    questions = Question.all
    questions = questions.where("title ILIKE ?", "%#{query}%") if query.present?
    return questions
  end
end