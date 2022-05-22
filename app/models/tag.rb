class Tag < ApplicationRecord
  belongs_to :article

  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-z]+\z/, 
                                                               message: "tag must consist of a single word and be lowercase" 
                                                             }
end
