require "pushbullet_api/version"

module PushbulletApi

  autoload :Configuration, 'pushbullet_api/configuration'
  autoload :HTTPRequest,   'pushbullet_api/HTTPRequest'
  autoload :Response,      'pushbullet_api/response'

  module Errors
    autoload :UnknownHTTPVerb, 'pushbullet_api/unknown_http_verb'
  end

  module Objects
    autoload :Response, 'pushbullet_api/objects/response'
    autoload :Pushes,   'pushbullet_api/objects/pushes'
  end

  module Files
    autoload :UploadRequestResponse, 'pushbullet_api/files/upload_request_response'
    autoload :UploadResponse,        'pushbullet_api/files/upload_response'
    autoload :UploadRequest,         'pushbullet_api/files/upload_request'
    autoload :Upload,                'pushbullet_api/files/upload'
    autoload :Uploader,              'pushbullet_api/files/uploader'
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(self.configuration)
  end
end
