class PostsController < ApplicationController
  before_action :set_current_user

  def index
  end

  # 投稿詳細ページ
  def show 
    @post = Post.find_by(id: params[:id])
  end

  # 投稿作成
  def create
    @images = params[:post_image]

    binding.irb

    @post = Post.new(
      user_id: @current_user.id,
      content: params[:content],
      address: "address",
      latitude: "latitude",
      longitude: "longitude"
      # 住所も追加する（address,latitude,longitude）
    )
      
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/#{@post.id}") # タイムラインに飛ばす(今は仮に投稿詳細ページに飛ばしている)
    else
      render("users/#{@current_user.id}") #　マイページ人飛ばす
    end
  end

end
