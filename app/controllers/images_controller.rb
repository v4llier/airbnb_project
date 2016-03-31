class ImagesController < ApplicationController

  def new
    @flat = Flat.find(params[:flat_id])
    @image = Image.new
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @image = @flat.images.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to new_flat_image_path, notice: 'Image successfully added' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:photo)
    end
end
