class Api::UsersController < ApplicationController
	before_action :find_user, only: [:show, :update, :destroy, :flat]

	def index
		@users = User.all

		render json: @users, status: 200
	end

	def show
		render json: @user
	end

	def create
		@user = User.new(user_params)

		if @user.save
			render json: @user
		else
			render json: @user.errors, status: :unprocessable_entity
		end
	end

	def update
		if @user.update(user_params)
			render json: @user
		else
			render json: @user.errors, status: :unprocessable_entity
		end
	end

	def destroy
		user_name = @user.try(:name)
		if @user.delete
			render json: { message: 'user ' + user_name + ' successfully deleted.' }, status: 200
		else
			render json: @user.errors, status: :unprocessable_entity
		end
	end

	def flat
		render json: @user.flat
	end

	private 

	def user_params
		params.permit(:name, :email)
	end

	def find_user
		@user = User.includes(:flat).find(params[:id])
	end
end
