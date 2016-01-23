class Movie < BaseModel
  include Ohm::Timestamps

  attribute :title
  attribute :date
  attribute :description
  attribute :notifications

  reference :user, :User

  attribute :liker_count
  attribute :hater_count

  set :likers, :User
  set :haters, :User

  def notifications_on?
    notifications.to_s == 'true'
  end
end
