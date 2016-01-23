class VoteNotifier
  attr_accessor :voter, :movie

  def initialize(voter, movie)
    @voter = voter
    @movie = movie
  end

  def notify
    _run if movie.notifications_on?
  end

  private

  def _run
    MovieMailer.new_vote_email(voter, movie).deliver
  end
end
