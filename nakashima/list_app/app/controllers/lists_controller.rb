class ListsController < ApplicationController
  before_action :login_required, only: [:new, :edit, :create]

  def index
    @lists = List.all
  end

  def show #/lists/:id
    @user = current_user
    @list = @user.lists.find_by(params[:id])
    @items =  @list.items #render @items のためのもの
  end

  def new
    @user = current_user
    @list = @user.lists.build
    
    # @item = @list.items.build
  end

  def edit
  end

  def create
    @user = current_user
    @list = @user.lists.build(list_params)
    if @list.save
      redirect_to  user_path(@user), notice: "アイテムを登録してください"
    else
      render 'new'
    end
  end

  private
    def list_params
      params.require(:list).permit(:name, :content, :user_id)
    end
end
