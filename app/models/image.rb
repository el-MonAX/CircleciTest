# frozen_string_literal: true

#
class Image < ApplicationRecord
  mount_uploader :url, ImageUploader
end
