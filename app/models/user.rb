class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :comments

  validates(:username, { presence: true, uniqueness: true })
  validates(:email, { presence: true, uniqueness: true })

  def self.search(search_term)
    where(['username ILIKE ? OR email ILIKE ?', "%#{search_term}%", "%#{search_term}%"])
  end

  def self.created_after(date)
    where(['created_at > ?', "#{date}"])
  end

  def self.is_not(name)
    where('username != ? AND email != ?', "#{name}", "#{name}")
  end
end
