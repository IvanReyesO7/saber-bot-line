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
      request["Authorization"] = "Bearer {FZhcGunvoqhbnU9abAc9yqhOi+a/VuyAHudL3O/akEC7/0Hw5LUv3VFgiQrjEmHqWt9rRD5XCV0lrFirS0FajizIEz64SskEwdh0ZqsAu9FnqDoNanJzNiIPM0tHhItYAtju982Ksc91izsK+r3GJQdB04t89/1O/w1cDnyilFU=}"
      request.body = JSON.dump({
        "to" => "Ua008b6426e2f49a5f08b16e8702e9ace",
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