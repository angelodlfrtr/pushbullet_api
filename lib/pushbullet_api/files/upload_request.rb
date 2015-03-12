module PushbulletApi
  module Files
    class UploadRequest < PushbulletApi::HTTPRequest

      class << self

        def create file_type, mime_type
          UploadRequestResponse.new(new(file_type, mime_type))
        end

      end

      def initialize file_name, mime_type
        self.action = 'upload-request'
        self.verb   = :post

        self.params = {
          :file_name => file_name,
          :file_type => mime_type
        }

        @response = send
      end

    end
  end
end
