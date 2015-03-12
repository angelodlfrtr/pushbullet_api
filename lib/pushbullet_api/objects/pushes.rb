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
          # todo
          nil
        end
      end

      def self.create args = {}
        PushbulletApi::Objects::Response.new(new(args))
      end

      def initialize args
        self.verb   = :post
        self.action = :pushes
        self.body   = args

        @response   = send
      end
    end
  end
end
