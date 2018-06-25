# frozen_string_literal: true

#
require 'rails_helper'

RSpec.describe Author, type: :model do
  subject { FactoryBot.create(:author) }

  it { expect(subject).to validate_presence_of :first_name }
  it { expect(subject).to validate_length_of :first_name }
  it { expect(subject).to validate_length_of :last_name }

  it { expect(subject).to have_many(:books) }
end