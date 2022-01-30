require 'date'
require_relative 'weather'

module Saber
  class LineMessages
    def self.morning
      message = "Buenos días gordos ☀️ \n"
      message += "hoy es #{(Date.today + 1).strftime('%b %d de %Y')}\n"
      message += "La temperatura media será de #{fetch_weather("Tokyo")}" + "\n"
      message += ",#{fetch_weather("Paris")}" + "\n"
      message += "y #{fetch_weather("Bogota")}" + "\n"
      message += "Cuídense mucho 😘"
      return message
    end
  end
end

puts Saber::LineMessages.morning
