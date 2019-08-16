class ListsController < ApplicationController
  skip_before_action :login_required

  def index
    @lists = List.all
  end

  def show
  end

  def new
    # binding.pry
    @user = current_user
    @list = @user.lists.build
  end

  def edit
  end

  def create
    @user = current_user
    @list = @user.lists.build(list_params)
    if @list.save
      redirect_to user_path(@user), notice: "リストを登録しました"
    else
      render 'new'
    end
  end

  private
    def list_params
      params.require(:list).permit(:name, :content, :user_id)
    end
end
