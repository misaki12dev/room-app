class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = Reservation.all
    @room = Room.find_by(params[:id])

  end

  def new
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(params[:id])
    if @reservation.invalid?
      render "rooms/show"
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
    flash[:notice] = "予約をキャンセルしました"
    redirect_to reservations_path
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_of_people, :room_id, :user_id)
  end

end
