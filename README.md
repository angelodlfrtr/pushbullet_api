# PushbulletApi

Pushbullet REST api wrapper in Ruby. In dev.

Do not use in production.

## Todo

- Write specs
- Add support for Websocket
- Publish on rubygems

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pushbullet_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pushbullet_api

## Usage

Use `require 'pushbullet_api'` before use this gem.

### Configure

Configure the gem with your api token :

```ruby
PushbulletApi.configure do |c|
  c.access_token = "your_access_token_here"
end
```

### Pushes

**Send note :**

```ruby
PushbulletApi::Objects::Pushes.note({
  :title => "Super title",
  :body  => "Super body"
})
```

**Send link :**

```ruby
PushbulletApi::Objects::Pushes.link({
  :title => "Super title",
  :body  => "Super body",
  :url   => "http://super.url"
})
```

**Send file :**

```ruby
PushbulletApi::Objects::Pushes.file({
  :body => "Super body",
  :file => File.open('a_super.file')
})
```

**Or :**

Set the key `type` in hash :

```ruby
PushbulletApi::Objects::Pushes.create({
  :type  => :link,
  :title => "Super title",
  :body  => "Super body",
  :url   => "http://super.url"
})
```

`type` can be `:link`, `:note` or `:file`.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pushbullet_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

