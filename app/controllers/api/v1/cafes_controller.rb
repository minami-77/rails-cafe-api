class Api::V1::CafesController < ApplicationController
  def index
    if params[:title].present?
      # @cafes = Cafe.where(title: params[:title])->完全一致
      @cafes = Cafe.where("title ILIKE ?","%#{params[:title]}%")
    else
      @cafes = Cafe.all
    end
  # in the localhost browser we see json instead of html
  # Putting the most recently created cafes first
  render json: @cafes.order(created_at: :desc)
  end

  def create
    @cafe = Cafe.new(cafe_params)
    if @cafe.save
      # redirect_to cafe_path(@cafe)
      render json: @cafe, status: :created
    else
      # render the form page, status: :unprocessable_entity
      render json: { error: @cafe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def cafe_params
    params.require(:cafe).permit(:title, :address, :picture, hours: {}, criteria: [])
  end
end
