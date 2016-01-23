require 'rails_helper'

RSpec.describe VoteNotifier do
  let(:voter) { FakeHelper.user }
  let(:movie) { FakeHelper.movie }

  describe '#notify' do
    context 'when notifications are enabled' do
      before { movie.set(:notifications, 'true') }

      subject { VoteNotifier.new(voter, movie).notify }

      it 'sends mail' do
        expect { subject }.to change { ActionMailer::Base.deliveries.size }.by(1)
      end

      it 'title is correct' do
        expect(subject.subject).to eq("New vote on your movie #{movie.title}")
      end

      it 'to is correct' do
        expect(subject.to.first).to eq(movie.user.email)
      end

      it 'body is correct' do
        body = subject.body.to_s
        expect(body).to match(/Hi #{movie.user.name}/)
        expect(body).to match(/<strong>#{movie.title}<\/strong>\nhas been voted by\n<strong>#{voter.name}<\/strong>/)
        expect(body).to match(/You got new vote for #{movie.title}!/)
        expect(body).to match(/Likes: #{movie.liker_count}/)
        expect(body).to match(/Hates: #{movie.hater_count}/)
      end
    end

    context 'when notifications are not enabled' do
      before { movie.set(:notifications, 'false') }

      subject { VoteNotifier.new(voter, movie).notify }

      it "doesn't send mail" do
        expect { subject }.to_not change { ActionMailer::Base.deliveries.size }
      end
    end
  end
end
