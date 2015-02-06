class ListsController < ApplicationController

 before_action :authenticate_user! # users must be signed in before any lists_controller method
  
  def show
    @list = current_user.list
    @item = Item.new
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.build_list(params.require(:list).permit(:title))
    if @list.save
      flash[:notice] = "List was saved."
      redirect_to @list
    else
      flash[:error] = "There was an error. Please try again."
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      flash[:notice] = "List was removed."
    else
      flash[:error] = "List was not removed."
    end
    redirect_to new_list_path
  end

 

end
