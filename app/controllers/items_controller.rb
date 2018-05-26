class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item was saved"
      redirect_to current_user
    else
      flash[:error] = "There was an error saving the item."
      render :create
    end
  end

  def destroy

    @item = current_user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Completed"
    else
      flash[:alert] = "Item couldn't be completed"
    end

    respond_to do |format|
      format.html
      format.js
   end

  end


  private

  def item_params
    params.require(:item).permit(:name, :user_id)
  end
end
