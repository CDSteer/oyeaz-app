class ContentsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @contents = @user.contents.all
  end

  def show
    @content = Content.find(params[:id])
  end


  def create
    @user = User.find(params[:user_id])
    @content = @user.contents.create(comment_params)
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:user_id])
    @content = @user.contents.find(params[:id])
    @content.destroy
    redirect_to root_path
  end

  private
    def comment_params
      params.require(:content).permit(:url)
    end
end
