class Message
  attr_accessor :contact_id, :body

  def initialize(body: nil, contact_id:)
    @body = body
    @contact_id = contact_id
  end

  def self.create(body:, contact_id:)
    url = "https://stage.skipio.com/api/v2/messages?token=#{ENV['SKIPIO_API_TOKEN']}"
    message_params = { recipients: ["contact-#{contact_id}"], message: { body: body} }
    RestClient.post(url, message_params)
  end

end