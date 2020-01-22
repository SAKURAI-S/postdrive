class HomesController < ApplicationController
	def top
		 @lists = List.all
	end
	def about
    end


  private
    def list_params
    params.require(:list).permit(:title, :body, :image)

  end
end
