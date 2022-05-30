class Comment < ApplicationRecord
  belongs_to :article

  validates :commenter, presence: true, length: { maximum: 30 }
  validates :body, presence: true
end
