module PushbulletApi
  module Files
    class UploadResponse < PushbulletApi::Response

      def initialize req
        super(req)
      end

      def url
        @request.upload_request_response.file_url
      end

      def is_success?; original_response.code == 204; end

      def error
        is_error? and @body
      end
    end
  end
end
