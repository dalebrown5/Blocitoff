class ItemsController < ApplicationController
  before_action :find_list

  def create
    @item = @list.items.build(item_params)

    unless @item.save
      flash[:error] = "There was an error. Please try again."
    end
     redirect_to @list
  end

  def destroy
    @item = Item. find(params[:id])
    if @item.destroy
      flash[:notice] = "Item was removed."
    else
      flash[:error] = "Item was not removed."
    end
    redirect_to @list
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

  def find_list
    @list = List.find(params[:list_id])
  end
  
end
