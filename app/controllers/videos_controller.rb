class VideosController < ApplicationController
  #list all videos - GET /videos
  def index
    @videos = Video.all
  end

  #show a single video - GET /videos/:id
  def show
    @video = Video.find(params[:id])
  end

  #new video creation form - GET /videos/new
  def new
    @video = current_user.videos.new
  end

  #create a new video - POST /videos
  def create
    @video = current_user.videos.new(video_params)

    if @video.save
      redirect_to @video
    else
      render :new
    end
  end

  #edit video form - GET /videos/:id/edit
  def edit
    @video = Video.find(params[:id])
  end

  #update an existing video - PUT /videos/:id
  def update
    @video = Video.find(params[:id])

    if @video.update(video_params)
      redirect_to @video
    else
      render :edit
    end
  end

  #destroy an existing video - DELETE /videos/:id
  def destroy
    Video.find(params[:id]).delete
    @videos = Video.all

    redirect_to '/'
  end

  private
  def video_params
    params.require(:video).permit(:title, :url, :author_id)
  end
end
