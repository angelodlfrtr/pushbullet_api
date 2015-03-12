module PushbulletApi
  class Configuration
    attr_accessor :http_endpoint, :access_token

    def initialize
      @access_token, @http_endpoint = '', 'https://api.pushbullet.com/v2/'
    end
  end
end
