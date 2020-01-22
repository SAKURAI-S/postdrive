class ListsController < ApplicationController
  def new
  	   @list = List.new
  end
  def create
         list = List.new(list_params)
        
        # DBへ保存する
         if list.save
        # トップ画面へリダイレクト
        redirect_to  top_path
         else
          @user = current_user
           @lists = List.all
           render :index
         end
    end
  def index
     @lists = List.all
     @user = current_user
  end
  def show
      @list = List.find(params[:id])
      @user = User.find(params[:id])
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
        redirect_to top_path #List一覧画面へリダイレクト
    end
    private
   
    def list_params
        params.require(:list).permit(:title, :body,:image)
        # params.require(:user).permit(:username, :profile_image, :introduction)
    end
end
