class Posts < ApplicationRecord
  has_many :comments, dependent: :nullify
  belongs_to :user

  validates(:title, { presence: { message: 'must be present!' }})
  validates(:body, { presence: true, length: { minimum: 5 } })
end
