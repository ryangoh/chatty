class PipeController < WebsocketRails::BaseController
  def create_something
    puts "create_something reached"
    # Room.create(:message => message["msg"], :name => message["number"])
    puts message
    WebsocketRails[:channel].trigger(:event, message)
    puts "create_something completed"
  end
end
