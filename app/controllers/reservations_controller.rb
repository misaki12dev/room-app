class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = Reservation.all
    @room = Room.find_by(params[:id])

  end

  def new
    @reservation = Reservation.new(reservation_params)
    if @reservation.invalid?
      redirect_to room_path(@reservation.room_id)

    else
      @days_gap = @reservation.days_gap
      @reservation.total_price = @reservation.room.room_price * @reservation.number_of_people * @days_gap
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.save
      redirect_to reservation_path(@reservation.id)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  private
  def reservation_params
    # params.require(:reservation).permit(:start_date, :end_date, :number_of_people).merge(room_id: params[:room_id], user_id: current_user.id)
    params.require(:reservation).permit(:start_date, :end_date, :number_of_people, :room_id, :user_id)
  end

end
