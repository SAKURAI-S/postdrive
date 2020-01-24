class ListsController < ApplicationController
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
        @list = List.find(params[:id])
  end
   def update
     list = List.find(params[:id])
        list.update(list_params)
        redirect_to list_path(list.id)
    end
    def destroy
        list = List.find(params[:id]) #データ(レコード)を1件取得
        list.destroy #データ（レコード）を削除
        redirect_to root_path #List一覧画面へリダイレクト
    end
    before_action :ensure_correct_user,{only: [:edit,:update,:destroy]}
  #...
  def ensure_correct_user
  @list = List.find_by(id: params[:id])
  if @list.user_id != @current_user.id
  flash[:notice] = "権限がありません"
  redirect_to("/lists/index")
  end
end
    private
   
    def list_params
        params.require(:list).permit(:title, :body,:image)
    end
    def user_params
    params.require(:user).permit(:username, :profile_image_id, :introduction)
  end
end
