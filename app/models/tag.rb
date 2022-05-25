class Tag < ApplicationRecord
  has_and_belongs_to_many :articles

  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-z0-9]+\z/,
                                                               message: 'must consist of a single word and be lowercase'
                                                             }
end
