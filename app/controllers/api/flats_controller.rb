class Api::FlatsController < ApplicationController
	before_action :find_flat, only: [:show, :update, :destroy, :users, :neighborhood]
	def index
		flats = Flat.all

		render json: flats
	end

	def show
		render json: @flat
	end

	def create
		flat = Flat.new(flat_params)

		if flat.save
			render json: flat
		else
			render json: flat.errors, status: :unprocessable_entity
		end
	end

	def update
		if @flat.update(flat_params)
			render json: @flat
		else
			render json: @flat.errors, status: :unprocessable_entity
		end
	end

	def destroy
		flat_name = @flat.try(:name)
		if @flat.delete
			render json: { message: 'flat ' + flat_name + ' successfully deleted.' }, status: 200
		else
			render json: @flat.errors, status: :unprocessable_entity
		end
	end

	def users
		render json: @flat.users
	end

	def neighborhood
		render json: @flat.neighborhood
	end

	private

	def flat_params
		params.permit(:name, :latitude, :longitude, :address)
	end

	def find_flat
		@flat = Flat.find(params[:id])
	end

end
