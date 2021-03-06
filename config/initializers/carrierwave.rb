# frozen_string_literal: true

CarrierWave.configure do |config|
  require 'carrierwave/orm/activerecord'

  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region:                'eu-central-1',
  }

  config.fog_directory = 'el-monax-bookstore'
end
