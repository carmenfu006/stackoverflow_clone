class AddVoteToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :vote, :integer, default: 0
  end
end
