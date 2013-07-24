module Autolinks
  class Parser
    attr_reader :text

    def text=(text)
      @text = Sanitize.clean(text)
    end

    def self.parse(text)
      parser = Parser.new
      parser.text = text
      parser.parse
    end

    def parse
      replace_url
      replace_handle
      replace_email
      replace_hashtag
      @text
    end

    def replace_handle
      @text.gsub!(Regex.handle, '<a href="http://twitter.com/\1" target="_blank">@\1</a>')
    end

    def replace_url
      @text.gsub!(Regex.http, '<a href="http://\1" target="_blank">\1</a>')
    end

    def replace_email
      @text.gsub!(Regex.email, '<a href="mailto:\1" target="_blank">\1</a>')
    end

    def replace_hashtag
      @text.gsub!(Regex.hashtag, '<a href="http://twitter.com/search?q=%23\1" target="_blank">#\1</a>')
    end
  end
end