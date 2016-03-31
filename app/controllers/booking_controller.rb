class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :edit]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @flat = Flat.find(params[:flat_id])
    # @user = current_user
    @user = User.first # for testing !!

    render 'flats/show' if !@user

    @booking = @flat.bookings.build(booking_params)
    @booking.user_id = @user.id

    if @booking.save
      byebug
      redirect_to flat_booking_path(@flat, @booking), notice: 'Booking was successful. I have a pleasant stay !'
    else
      redirect_to flat_path(@flat)
    end
  end


  def edit
  end

  def update

    # TO REMOVE JASON STUFF
  end

  def show

  end

  private

  def set_booking
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :comment, :rating)
  end
end
