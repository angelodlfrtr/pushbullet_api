require 'json'

module PushbulletApi
  class Response

    attr_reader :body

    def initialize(request_class)
      @request = request_class
      load_to_json
    end

    def original_response; @request.response; end

    def load_to_json
      begin
        @body = JSON.parse(original_response.body)
      rescue => e
        @body = original_response.body
      end
    end

    def code; original_response.code; end

    def is_success?; original_response.code == 200; end
    def is_error?; !is_success?; end

    def error
      is_error? and @body['error']
    end
  end
end
