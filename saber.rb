require 'net/http'
require 'uri'
require 'json'
require_relative 'messages'


module Saber
  class LineBot
    def self.post_message(text)
      uri = URI.parse("https://api.line.me/v2/bot/message/push")
      request = Net::HTTP::Post.new(uri)
      request.content_type = "application/json"
      request["Authorization"] = "Bearer {#{ENV[]}}"
      request.body = JSON.dump({
        "to" => "#{ENV[]}",
        "messages" => [
          {
            "type" => "text",
            "text" => "#{text}"
          }
        ]
      })

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
    end
  end
end

Saber::LineBot.post_message(Saber::LineMessages.morning)