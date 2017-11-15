class User < ApplicationRecord
  has_many :notes, dependent: :destroy  #dependent ユーザーが削除されると紐づいたnoteも削除
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name, {presence: true, length: {maximum: 50}}
  validates :email, {presence: true}
  has_secure_password
  validates :password, {presence: true, length: {minimum: 6}}

  include Gravtastic
  gravtastic

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.degest(remember_token))
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end
end
