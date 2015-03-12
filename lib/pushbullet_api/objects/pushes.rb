module PushbulletApi
  module Objects
    class Pushes < PushbulletApi::HTTPRequest

      class << self

        def link args = {}
          create(args.merge({type: :link}))
        end

        def note args = {}
          create(args.merge({type: :note}))
        end

        def file args = {}
          create(args.merge({type: :file}))
        end
      end

      def self.create args = {}
        PushbulletApi::Objects::Response.new(new(args))
      end

      def update iden, args = {}
        # todo
      end

      def initialize args
        self.verb   = :post
        self.action = :pushes

        # File work
        if args.has_key?(:file)
          file = args.delete(:file)
          uploader = PushbulletApi::Files::Uploader.create(file)

          args = args.merge({
            :file_name => uploader.file_name,
            :file_type => uploader.content_type,
            :file_url  => uploader.url
          })
        end

        self.body   = args

        @response   = send
      end
    end
  end
end
