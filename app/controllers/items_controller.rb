class ItemsController < ApplicationController
  before_action :find_list

  def create
    @item = @list.items.build(params.require(:item).permit(:name))

    unless @item.save
      flash[:error] = "There was an error. Please try again."
    end
     redirect_to @list
  end

  def delete
    @list = List.find(params[:list_id])
    @item = @list.item.find(params[:id])

    if @item.delete
      flash[:notice] = "Item was removed."
    else
      flash[:error] = "Item was not removed."
    end
    redirect_to @list
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end
end
