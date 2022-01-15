class User < ApplicationRecord
  #リレーション
  has_many :rooms
  has_many :reservations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #画像アップロード
  mount_uploader :profile_image_id, RoomImageUploader
end
