class Api::V1::CafesController < ApplicationController
  def index
    if params[:title].present?
      # @cafes = Cafe.where(title: params[:title])->完全一致
      @cafes = Cafe.where("title ILIKE ?","%#{params[:title]}%")
    else
      @cafes = Cafe.all
    end
    # give me json, not html
    render json: @cafes
  end
end
