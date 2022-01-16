class Reservation < ApplicationRecord
  #リレーション
  belongs_to :user
  belongs_to :room
  #バリデーション
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_people, presence: true
  validate :date_before_start
  validate :start_end_checker

  def days_gap
    (self.end_date.to_date - self.start_date.to_date).to_i + 1
  end

  def date_before_start
    errors.add(:start_date, "今日以降の日付にしてください") if start_date < Date.today
  end

  def start_end_checker
    errors.add(:end_date, 'は開始日以降にしてください') unless
    start_date < end_date
  end

  def total_price
     self.number_of_people * self.days_gap * self.room.room_price
  end

end
