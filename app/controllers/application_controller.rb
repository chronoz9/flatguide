class ApplicationController < ActionController::API

	rescue_from ActiveRecord::RecordNotFound do
    render json: {message: 'record not found'}, :status => :not_found
  end
end
