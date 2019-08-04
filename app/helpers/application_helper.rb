module ApplicationHelper
    

    def chat_rooms
      @chat_rooms ||= ChatRoom.all
    end

end
