class Post < ApplicationRecord
  # has_many :likes, :comments
  validates(:title, { presence: { message: 'must be present!' }})
  validates(:body, { presence: true, length: { minimum: 5 } })
end
