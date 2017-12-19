class MessagesController < ApplicationController

  # def index
  #   contact_id = params[:contact_id]
  #   url = "https://stage.skipio.com/api/v2/contacts/#{contact_id}/messages?token=#{ENV['SKIPIO_API_TOKEN']}&page=1&per=100"
  #   @messages = JSON.parse(RestClient.get(url).body)['data']
  # end

  def new
    @message = Message.new(contact_id: params[:contact_id])
    @contact_name = params[:contact_full_name]
  end

  def create
    if Message.create(body: params[:body], contact_id: params[:contact_id])
      flash[:success] = "Message was successfully sent."
      redirect_to root_path
    else
      flash[:danger] = "Message not sent."
      redirect_to root_path
    end
  end

end