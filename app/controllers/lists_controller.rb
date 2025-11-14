class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
    @list.bookmarks.build
  end 

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_content
    end
  end

  private
  
  def list_params
    params.require(:list).permit(:name, :photo, bookmarks_attributes: [:comment, :movie_id, :_destroy])
  end
end
