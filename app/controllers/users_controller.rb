class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find_by(id: params[:id])
  end


  # ログイン
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password]) # @user がいて、なおかつパスワードとユーザーのパスワードが一致する時、下の処理をする
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("home/top")
    end
  end

  
  # 新規ユーザー登録
  def create
    
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      prof_image: "default_user.jpg",
      from: params[:from]
    )

    if params[:prof_image] #もし画像があったら
      @user.prof_image = "#{@user.id}.jpg" #ユーザーのイメージネームにわかりやすい名前で保存
      image = params[:prof_image] #変数に画像のデータを入れる
      File.binwrite("public/user_images/#{@user.prof_image}", image.read) #画像データを取得
    end


    if @user.save
      session[:user_id] = @user.id
      binding.irb
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("home/top")
    end
  end


  # ログアウト
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

  def edit
    @user = User.find_by(id: @current_user.id) #ログインしているユーザーの情報を格納
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.from = params[:from]

    if params[:prof_image] #もし画像があったら
      @user.prof_image = "#{@user.id}.jpg" #ユーザーのイメージネームにわかりやすい名前で保存
      image = params[:prof_image] #変数に画像のデータを入れる
      File.binwrite("public/user_images/#{@user.prof_image}", image.read) #画像データを取得
    end

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      flash[:notice] = "ユーザー情報の編集に失敗しました。"
      render("home/top")
    end
    
  end

end
