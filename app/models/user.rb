class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_complexity

  def password_complexity
  return if password.blank? || password =~ /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/

  errors.add :password, 'Complexity requirement not met. Please use at least 1 letter and 1 number'
  end

  validates :nickname, presence: true
  japanese_regex = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  validates :last_name, presence: true, format: { with: japanese_regex }
  validates :first_name, presence: true, format: { with: japanese_regex }
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
end
