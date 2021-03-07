class DiariesController < ApplicationController
  before_action :require_user_logged_in
  def index
    @diaries = current_user.diaries.order(id: :desc).page(params[:page])
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def new
    @diary = current_user.diaries.build
  end

  def create
    @diary = current_user.diaries.build(diary_params)
    if @diary.save
      flash[:success] = '投稿しました。'
      redirect_to diaries_path
    else
      flash.now[:danger] = '投稿できませんでした。'
      render :new
    end
  end

  def destroy
  end
  
  private
  
  def diary_params
    params.require(:diary).permit(:title, :content, :image)
  end
end
