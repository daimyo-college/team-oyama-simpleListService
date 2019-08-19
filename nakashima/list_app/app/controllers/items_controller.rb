class ItemsController < ApplicationController
  before_action :login_required, only: [:new, :edit, :create, :destroy]

  def index
    @items = Items.all
  end

  def show
    #アイテムの詳細,チェリー本,macbook,とか
  end

  def new #
    # # @list = List.find(params[:list_id]) #作るリストのオブジェクトを代入する
    # # @item = Item.new

    # # @list = item.list
    # # @item = @list.items.build

    # # @list = List.find_by(id: list.id)
    # @list = List.find(params[:id])
    # @item = @list.items.build
    @list = List.find(params[:id]) #urlを変更してparamsで受け取るようにした
    @item = @list.items.build
    
  end

  def edit
  end

  def create
    @list = List.find(params[:item][:list_id])
    @item = @list.items.build(item_params)
    if @item.save
      redirect_to list_path(@list), notice: "アイテムを登録しました。"
    else
      render "users"
    end
  end

  def destroy
  end

  private
    def item_params
      params.require(:item).permit(:name, :content, :list_id)
    end

    # def current_list
    #   @list = List.find_by(id: current_user)
    # end
end
