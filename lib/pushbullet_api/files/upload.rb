module PushbulletApi
  module Files
    class Upload < PushbulletApi::HTTPRequest

      attr_reader :file, :upload_request_response

      class << self

        def create file, upload_request_response
          PushbulletApi::Files::UploadResponse.new(new(file, upload_request_response))
        end

      end

      def initialize file, upload_request_response
        @file, @upload_request_response = file, upload_request_response

        self.headers = {
          'Authorization' => '',
          'Content-Type'  => 'multipart/form-data'
        }

        self.verb   = :post
        self.url    = upload_request_response.upload_url
        self.action = ''

        self.params        = upload_request_response.data
        self.params[:file] = file

        @response = send
      end
    end
  end
end
