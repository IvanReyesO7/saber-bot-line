require 'date'
require_relative 'weather'

module Saber
  class LineMessages
    def self.morning
      message = "Buenos días gordos ☀️ \n"
      message += "hoy es #{(Date.today + 1).strftime('%b %d de %Y')}\n"
      message += fetch_weather + "\n"
      message += "Cuídense mucho 😘"
      return message
    end
  end
end
