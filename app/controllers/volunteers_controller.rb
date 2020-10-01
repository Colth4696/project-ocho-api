class VolunteersController < ApplicationController

        def index
            @volunteers = Volunteer.all
            render json: {
            volunteers: @volunteers
            }
        end 

        def new
            @volunteer = Volunteer.new
        end
    

    def show
        @volunteer =Volunteer.find(params[:id])
    if @volunteer
        render json: {
        volunteer: @volunteer
        }
        else
        render json: {
            status: 500,
            errors: ['volunteer not found']
        }
        end
    end
    
    
    def create
        puts session{:user_id}
        puts volunteer_params
        puts "I am here"
        @volunteer = Volunteer.new(volunteer_params)
        @volunteer.user_id = session[:user_id]
        if @volunteer.save
        render json: {
        status: :created,
        volunteer: @volunteer
        }
        else 
        render json: {
            status: 500,
            errors: @volunteer.errors.full_messages
        }
        end
    end

    private

    def volunteer_params
        puts "are we reaching"
        puts params
        params.require(:volunteer).permit(:user_id, :request_id)
    end
end


