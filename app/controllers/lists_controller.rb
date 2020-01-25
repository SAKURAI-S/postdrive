class ListsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :index, :new, :create, :update, :destroy]
  def new
    @list = List.new
  end
  def create
    @lists = List.new(list_params)
    @lists.user_id = current_user.id
    if @lists.save
      redirect_to list_path(@lists.id),notice:'successfully'
      # flash[:success] = ''
    else
      @user = current_user
      @lists = Lisr.all
      render :index
    end
  end
  def index
    @lists = List.all
    @user = current_user
  end
  def show
    @list = List.find_by(id: params[:id])
    @user = User.find_by(id: @list.user_id)
  end
  def edit
    @list = List.find_by(id: params[:id])
    if @list.user != current_user
      redirect_to lists_path
    end
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to list_path
  end
  def destroy
    @list = List.find(params[:id]) #データ(レコード)を1件取得
    @list.destroy #データ（レコード）を削除
    redirect_to lists_path #List一覧画面へリダイレクト
  end
  #...
  private

  def list_params
    params.require(:list).permit(:title, :body,:image)
  end
  def user_params
    params.require(:user).permit(:username, :profile_image_id, :introduction)
  end
end