class ProfileController < ApplicationController
  def index
  end

  def edit
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
