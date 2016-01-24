require 'rails_helper'

RSpec.describe VotingBooth do
  let(:user) { create_user }
  let(:movie) { create_movie }

  let(:vote_notifier) { double('VoteNotifier') }

  describe '#vote' do
    context 'when notification is on' do
      before do
        allow(VoteNotifier).to receive(:new).and_return(vote_notifier)
        allow(vote_notifier).to receive(:notify).and_return(true)
      end

      subject { VotingBooth.new(user, movie) }

      it 'calls VoteNotifier with correct params' do
        expect(VoteNotifier).to receive(:new).with(user, movie)
        expect(vote_notifier).to receive(:notify)
        subject.vote(:like)
      end
    end
  end
end
