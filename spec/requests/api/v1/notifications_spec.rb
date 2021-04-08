# frozen_string_literal: true

require 'rails_helper'

describe('Api::V1::Notifications', type: :request) do
  describe 'POST /apnsp8' do
    # TODO: Pending create tests with dummy p8 file
    it 'pass' do
      a = true
      expect(a).to(eq(true))
    end
  end
end
