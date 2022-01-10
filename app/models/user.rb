class User < ApplicationRecord
  #リレーション
  has_many :rooms
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
