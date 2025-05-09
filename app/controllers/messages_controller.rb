class MessagesController < ApplicationController
  before_action :authenticate_user!
  def new
    @chat_user = User.find(params[:user_id])
    @messages = Message.where(sender: current_user, receiver: @chat_user)
                       .or(Message.where(sender: @chat_user, receiver: current_user))
                       .order(:created_at)
    p @messages
    
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    if @message.save
      redirect_to new_message_path(user_id: @message.receiver_id)
    else
      render :new
    end
  end

  def index
  end

  private

  def message_params
    params.require(:message).permit(:body, :receiver_id)
  end
end
