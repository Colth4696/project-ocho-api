class RequestsController < ApplicationController
    
  
    def index
        @requests = Request.all
        render json: {
        requests: @requests
        }
    end

    def show
        @request =Request.find(params[:id])
      if @request
          render json: {
          request: @request
          }
        else
          render json: {
            status: 500,
            errors: ['request not found']
          }
        end
      end
      
      def create
        puts session[:user_id]
        @request = Request.new(request_params)
        @request.owner_id = session[:user_id]
        if @request.save
          login!
          render json: {
          status: :created,
          request: @request
          }
        else 
          render json: {
            status: 500,
            errors: @request.errors.full_messages
          }
        end
      end
  
    private
      # Only allow a list of trusted parameters through.
      def request_params
        params.require(:request).permit(:title, :description, :longitude, :latitude, :request_type)
      end
end

