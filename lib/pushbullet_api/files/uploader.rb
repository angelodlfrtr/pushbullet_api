require "mime-types"

module PushbulletApi
  module Files
    class Uploader

      attr_reader :url, :file_name, :content_type

      class << self
        def create(file)
          new(file)
        end
      end

      def initialize file

        content_type = ''
        basename     = File.basename(file.path)
        types        = MIME::Types.of(basename)

        if types.length > 0
          content_type = types.first.content_type
        end

        upload_request = PushbulletApi::Files::UploadRequest.create(basename, content_type)
        upload         = PushbulletApi::Files::Upload.create(file, upload_request)

        @url, @file_name, @content_type = upload.url, basename, content_type
      end
    end
  end
end
