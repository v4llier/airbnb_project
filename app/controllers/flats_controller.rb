class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :update, :destroy, :edit]

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)

    respond_to do |format|
      if @flat.save
        format.html { redirect_to flat_path(@flat.id), notice: 'flat was successfully created.' }
        format.json { render :show, status: :created, location: @flat }
      else
        format.html { render :new }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def index
    @flats = Flat.all
  end

  def show

  end

  def destroy
  end

  def update
    respond_to do |format|
      if @flat.update(flat_params)
        format.html { redirect_to @flat, notice: 'flat was successfully updated.' }
        format.json { render :show, status: :ok, location: @flat }
      else
        format.html { render :edit }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    # input
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @guests = params[:guests]
    @city = params[:city]
    p params

    # some thinking
    # p Flats.include? @city

    # output (will have to be filered)
    @flats = Flat.all

  end




  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :description, :city, :capacity, :address, :price, :user_id)
  end
end
