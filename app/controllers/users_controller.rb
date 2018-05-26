class UsersController < ApplicationController

  def show
    @user = current_user
    @item = Item.new
    @items = @user.items
  end
end
