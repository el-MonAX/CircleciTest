# frozen_string_literal: true

# Home helpers
module HomeHelper
  def active(index)
    'active' if index.zero?
  end
end
