class Room < ApplicationRecord
  #リレーション
  belongs_to :user
  has_many :reservations
  #画像アップロード
  mount_uploader :room_image, RoomImageUploader
  #バリデーション
  validates :room_name, presence: true
  validates :room_description, presence: true
  validates :room_address,presence: true
  validates :room_price, presence: true
  validates :room_image, presence: true
end
