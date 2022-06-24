class Api::NeighborhoodsController < ApplicationController
	before_action :find_neighborhood, only: [:show, :update, :destroy, :flats]
	def index
		neighborhoods = Neighborhood.all

		render json: neighborhoods
	end

	def show
		render json: @neighborhood
	end

	def create
		neighborhood = Neighborhood.new(neighborhood_params)

		if neighborhood.save
			render json: neighborhood
		else
			render json: neighborhood.errors, status: :unprocessable_entity
		end
	end

	def update
		if @neighborhood.update(neighborhood_params)
			render json: @neighborhood
		else
			render json: @neighborhood.errors, status: :unprocessable_entity
		end
	end

	def destroy
		neighborhood_name = @neighborhood.try(:name)
		if @neighborhood.delete
			render json: { message: 'neighborhood ' + neighborhood_name + ' successfully deleted.' }, status: 200
		else
			render json: @neighborhood.errors, status: :unprocessable_entity
		end
	end

	def flats
		if @neighborhood.flats.exists?
			render json: @neighborhood.flats, status:200
		else 
			render json: [], status:404
		end
	end

	private

	def neighborhood_params
		params.permit(:name, :latitude, :longitude, :radius, :address)
	end

	def find_neighborhood
		@neighborhood = Neighborhood.find(params[:id])
	end

end
