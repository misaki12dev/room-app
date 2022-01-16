class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "部屋の登録ができました"
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to rooms_posts_path
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "部屋を削除しました"
    redirect_to :rooms
  end

  def posts
    @posts = Room.all
  end


  def search
    @rooms = Room.search(params[:area], params[:keyword])
    render "index"
  end


  private
  def room_params
   params.require(:room).permit(:room_name, :room_description, :room_price, :room_address, :room_image, :user_id)
  end

end
