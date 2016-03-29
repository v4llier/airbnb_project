class ProfileController < ApplicationController
  def index
  end

  def edit
    @profile = current_user
  end

  def create
  end

  def new
  end

  def update
  end

  def destroy
  end

  def show
    @profile = current_user
  end
end
