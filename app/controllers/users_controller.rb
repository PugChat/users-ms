class UsersController < ApplicationController

    #get
    def index
      render json: User.all, status: 200
    end

    #get
    def show
        user = User.find(params[:id])
        render json: user, status: 200
    end

    def findByUsername
        user = User.find_by(:username => params[:username])
        render json: user, status: 200
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user,status:201
        else
            render json:user.errors, status: :unprocessable_entity
        end
    end

    def updated
        user = User.find(params[:id])
        if user.update(user_params)
           render json:user, status:200
        else
            render json:user.errors, status: :unprocessable_entity
        end
    end

    def user_params
        params.require(:user).permit(:id, :mail, :username, :verification, :active, :password, :password_confirmation)
    end

end
