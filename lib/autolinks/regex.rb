module Autolinks
  class Regex
    def self.handle
      /\B@\w+/i
    end

    def self.handle_name
      /\B@(\w+)/i
    end

    def self.http
      /(https?:\/\/[\S]+\.[!#$&-;=?-[\]_a-z~]|%[\w\d]{2}]+[\w])/i
    end

    def self.http_address
      /https?:\/\/([\S]+\.[!#$&-;=?-[\]_a-z~]|%[\w\d]{2}]+[\w])/i
    end

    def self.hashtag
      /(\B#\w+)/i
    end

    def self.hashtag_name
      /\B#(\w+)/i
    end

    def self.email
      /(\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b)/i
    end
  end
end
