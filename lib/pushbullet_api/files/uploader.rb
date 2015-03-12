require "mime-types"

module PushbulletApi
  module Files
    class Uploader

      attr_reader :url

      class << self
        def create(file)
          ins = new(file)
          ins.url
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

        @url = upload.url
      end
    end
  end
end
