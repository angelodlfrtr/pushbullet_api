require 'rest_client'
require 'multi_json'

module PushbulletApi
  class HTTPRequest

    attr_accessor :headers, :verb, :body, :action, :params, :url
    attr_reader :response

    protected

      def send
        check_verb

        prms = nil
        if self.params
          prms = self.params
        else
          prms = MultiJson.dump(self.body)
        end

        RestClient.send(self.verb.to_sym,
                        build_url,
                        prms,
                        build_headers) do |response, request, result|

          @response = response
        end

        @response
      end

    private

      def build_url
        (self.url || PushbulletApi.configuration.http_endpoint) + self.action.to_s
      end

      def build_headers
        {
          'Authorization' => "Bearer #{PushbulletApi.configuration.access_token}",
          'Content-Type'  => 'application/json'
        }.merge(self.headers || {})
      end

      def check_verb
        raise PushbulletApi::UnknownHTTPVerb unless [:post, :get, :delete].include?(self.verb.to_sym)
      end
  end
end
