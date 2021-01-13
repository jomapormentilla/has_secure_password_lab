class UsersController < ApplicationController
    before_action :create_session, only: [:create]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id

        if !@user.authenticate(params[:password])
            redirect_to new_user_path
        end
    end

    def create_session

    end

    def homepage
    end

    private

    def user_params
        params.require(:user).permit(
            :name,
            :password,
            :password_confirmation
        )
    end
end
