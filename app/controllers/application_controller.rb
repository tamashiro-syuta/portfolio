class ApplicationController < ActionController::Base

    # セッションしてるユーザーの確認
    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

end
