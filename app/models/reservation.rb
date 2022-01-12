class Reservation < ApplicationRecord
  #リレーション
  belongs_to :user
  belongs_to :room
  #バリデーション
  validates :start_date, presence: true
  validates :end_date, presence: true

  def days_gap
    (self.end_date.to_date - self.start_date.to_date).to_i + 1
  end

  def total_price
     self.number_of_people * self.days_gap * self.room.room_price
    # @reservation.room.room_price
  end
end
