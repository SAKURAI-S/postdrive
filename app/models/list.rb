class List < ApplicationRecord
	belongs_to :user
	 attachment :image
end
def user
  #インスタンスメソッドないで、selfはインスタンス自身を表す
  return User.find_by(id: self.user_id)
end