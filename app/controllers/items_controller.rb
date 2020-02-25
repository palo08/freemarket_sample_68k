class ItemsController < ApplicationController
  before_action :set_item, only:[:destroy]

  def index
    @items = Item.all.order("created_at DESC")
    @item_images = ItemImage.all
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @parents = Category.order("id ASC").limit(13)
  end
  def create
  end
  def show
    @item = Item.find(params[:id]) 
    @parents = Category.order("id ASC").limit(13)
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def destroy
    @parents = Category.order("id ASC").limit(13)
    @item.destroy
    render :delete unless @item.user_id == current_user.id && @item.destroy
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

end
