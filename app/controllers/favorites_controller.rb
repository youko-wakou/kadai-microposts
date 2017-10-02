class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    # binding.pry
    # @user = Micropost.select("user_id")
    # これでログインユーザーが
    # micropost = current_user.Micropost.find_by(user_id: user_id)
    # m = Micropost.find(1)
    # @id = m.favorite_microposts
    # micropost = Micropost.find_by(id: params[:micropost_id])
    # micropost = params[:micropost_id].to_i
    # current_user.clip(params[:micropost_id].to_i)
    # microposts = Micropost.find(params[:micropost_id])
     
    micropost = Micropost.find(params[:micropost_id])
    current_user.clip(micropost)
      
  

    flash[:success] = 'マイクロポストをお気に入りに追加しました'
    redirect_to root_path
    
  end

  def destroy
    # @user = User.select("user_id")
    micropost = Micropost.find(params[:micropost_id])
    current_user.unclip(micropost)
    flash[:success] = 'マイクロポストのお気に入りを解除しました'
    redirect_to root_path
  end
end
