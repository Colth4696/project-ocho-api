class MessagesController < ApplicationController

    def index
        @messages = Message.all
        render json: {
        messages: @messages
        }
    end
end

    def new
        @message = Message.new
    end   

def show
    @message =Message.find(params[:id])
  if @message
      render json: {
      message: @message
      }
    else
      render json: {
        status: 500,
        errors: ['message not found']
      }
    end
  end

def create
    @message = Message.new(message_params)
    @message.message = ""
    @message.sender_id = session[:user_id]
    @message.receiver_id = request[:owner_id]
    @message.request_id = request[:id]
    if @message.save
      login!
      render json: {
      status: :created,
      message: @message
      }
    else 
      render json: {
        status: 500,
        errors: @message.errors.full_messages
      }
    end
  end
private

# Never trust parameters from the scary internet, only allow the white list through.
def message_params
params.require(:message).permit(:message, :sender_id, :receiver_id, :request_id)
end