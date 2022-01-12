class User < ApplicationRecord
  #リレーション
  has_many :rooms
  has_many :reservations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
