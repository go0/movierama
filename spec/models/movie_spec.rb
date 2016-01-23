require 'rails_helper'

RSpec.describe Movie do
  describe '#notification_enabled?' do
    context "when it's on" do
      subject { Movie.new(notifications: 'true') }

      it 'returns true' do
        expect(subject.notifications_on?).to be true
      end
    end

    context "when it's off" do
      subject { Movie.new(notifications: 'false') }

      it 'returns false' do
        expect(subject.notifications_on?).to be false
      end
    end

    context "when it's nil" do
      subject { Movie.new }

      it 'returns false' do
        expect(subject.notifications_on?).to be false
      end
    end
  end
end
