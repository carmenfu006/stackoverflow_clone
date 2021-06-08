class Comment < ApplicationRecord
  
  # after_create_commit { broadcast_prepend_to 'comments' }
  # after_update_commit { broadcast_replace_to 'comments' }
  # after_destroy_commit { broadcast_remove_to 'comments' }

  validates :body, presence: true

  belongs_to :user
  belongs_to :answer

  # broadcasts_to :answer

  delegate :question, to: :answer, allow_nil: true
end