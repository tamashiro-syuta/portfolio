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
    
    @post = Post.new(
      user_id: @current_user.id,
      content: params[:content],
      address: "address",
      latitude: "latitude",
      longitude: "longitude",
      images: []
      # 住所も追加する（address,latitude,longitude）
    )
    
      # @images = params[:post_image]
      # # Imagesテーブルに画像のパスを入れて、post_imageテーブルにさっきImagesに入れたデータのidを入れる。（postのidと一緒に入れる）
      # # これを画像の枚数分繰り返す
      # @images.each do |image|
      #   tempfile = image.tempfile
      #   @save_to = "public/post_images/#{image.filename}"
      #   FIleUtils.mv(tempfile, save_to)
      #   Image.new(
      #     save_to: @save_to
      #   )
      # end
      
    if @post.save
      flash[:notice] = "投稿を作成しました"
      
      binding.irb
      redirect_to("/users/#{@current_user.id}") # タイムラインに飛ばす(今は仮に投稿詳細ページに飛ばしている)
    else
      render("home#top") #　マイページに飛ばす
    end

  end

end