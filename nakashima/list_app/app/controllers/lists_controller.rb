class ListsController < ApplicationController
  before_action :login_required, only: [:new, :edit, :create]

  def index
    @lists = List.all
  end

  def show #/lists/:id
    # binding.pry
    @user = current_user
    @list = @user.lists.find(params[:id])
    @items =  @list.items.where(list_id: @list.id) #render @items のためのもの
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
