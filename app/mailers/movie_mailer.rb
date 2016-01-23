class MovieMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_vote_email(voter, movie)
    @voter = voter
    @movie = movie
    mail(to: @movie.user.email, subject: "New vote on your movie #{@movie.title}")
  end
end
