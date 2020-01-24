class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #usernameを必須・一意とする
  validates_uniqueness_of :username
  validates_presence_of :username
  attachment :profile_image # ここを追加
  #usernameを利用してログインするようにオーバーライド
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #認証の条件式を変更する
      where(conditions).where(["username = :value", { :value => username }]).first
    else
      where(conditions).first
    end
  end

  #emailを不要とする
  def email_required?
    false
  end

  def email_changed?
    false
  end

end
def lists
  return List.where(user_id: self.id)
end