class PostsController < ApplicationController
  def index
  end

  # 投稿詳細ページ
  def show 
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end

  # 投稿作成
  def create
    @post = Post.new(
      user_id: @current_user.id,
      content: params[:content],
      title: params[:title],
      address: "aiueo",
      latitude: "aiueo",
      longitude: "aiueo"
      # 住所も追加する（address,latitude,longitude）
    )
    
    # if params[:post_image] #もし画像があったら
    #   post_path = params[:post_image]
    #   @post_image = Image.new(path: )   # Imageテーブルに画像のパスを入れたい
    #   @user.post_image = "#{@user.id}.jpg" #ユーザーのイメージネームにわかりやすい名前で保存
    #   image = params[:post_image] #変数に画像のデータを入れる
    #   File.binwrite("public/post_images/#{@user.post_image}", image.read) #画像データを取得
    # end
    # @post_image = 
      
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index") # タイムラインに飛ばす
    else
      render("users/#{@current_user.id}") #　マイページ人飛ばす
    end
  end

end
