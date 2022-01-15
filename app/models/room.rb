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

    def self.search(search, keyword)
      if search
        Room.where(['room_address like ?', "%#{search}%"])
      elsif keyword
        Room.where(["room_name like? OR room_address like? OR room_description like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
      end
  end


end
