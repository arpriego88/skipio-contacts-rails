class ContactsController < ApplicationController
  def index
    url = "https://stage.skipio.com/api/v2/contacts?token=#{ENV['SKIPIO_API_TOKEN']}&page=1&per=100"
    @contacts = JSON.parse(RestClient.get(url).body)['data']
  end
end