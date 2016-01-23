require 'rails_helper'

RSpec.describe UserRegistration do
  let(:now) { DateTime.now }

  describe '#created?' do
    before do
      allow(User).to receive(:create).and_return(true)
      Timecop.freeze(now)
    end

    subject! do
      UserRegistration.new({
          'provider' => 'github',
          'uid' => '123123',
          'info' => {
            'name' => 'James Bond',
            'email' => 'james@bond.com'
          }
      }).created?
    end

    it 'calls User.create with correct params' do
      expect(User).to have_received(:create).with(hash_including(
        uid: 'github|123123',
        name: 'James Bond',
        email: 'james@bond.com',
        created_at: now.utc.to_i
      ))
    end
  end
end
