class EmotionsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "emotions_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
