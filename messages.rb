require 'date'
require_relative 'weather'

module Saber
  class LineMessages
    def self.morning
      message = "Buenos dias gordos! hoy es #{(Date.today + 1).strftime('%b %d, %Y')}\n"
      message += fetch_weather + "\n"
      message += "Cuidense mucho 😘"
      return message
    end
  end
end
