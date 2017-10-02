class MicropostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :require_user_logged_in, only: [:followings,:followers]
  before_action :correct_user, only:[:destroy]
  
  def index
    @user = User.find_by(id: params[:user])
  end
  def create
      # @id = Micropost.find(params[:id])

    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'メッセージを投稿しました'
      redirect_to root_url
    else
      @microposts = current_user.feed_microposts.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました'
      render 'toppages/index'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = 'メッセージを削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  def clips
    @micropost = Micropost.find(params[:id])
    @clips = @micropost.favorites.page(params[:page])
    counts(@micropost)
  end
  
  def clipeds
    @micropost = Micropost.find(params[:page])
    @clipeds = @micropost.favorites.page(params[:page])
    counts(@micropost)
  end
  
  
  private
  
  def micropost_params 
    params.require(:micropost).permit(:content)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url
    end
  end
  
end
