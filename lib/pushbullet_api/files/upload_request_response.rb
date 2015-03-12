module PushbulletApi
  module Files
    class UploadRequestResponse < PushbulletApi::Response

      def initialize req
        super(req)
      end

      def is_success?
        original_response.code == 200
      end

      def is_error?; !is_success?; end

      def error
      end

      def method_missing(m, *args, &block)
        if @body.has_key?(m.to_s)
          @body[m.to_s]
        else
          super
        end
      end
    end
  end
end
