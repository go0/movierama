module FakeHelper
  def create_movie
    Movie.create(
      title:        'Empire strikes back',
      description:  'Who\'s scruffy-looking?',
      date:         '1980-05-21',
      user:         create_author,
      liker_count: 10,
      hater_count: 10
    )
  end

  def create_user
    User.create(
      uid:  'null|12345',
      name: 'Bob',
      email: 'bob@gxmail.com'
    )
  end

  def create_author
    User.create(
      uid:  'null|12346',
      name: 'James',
      email: 'james@gxmail.com'
    )
  end
end

RSpec.configure do |c|
  c.include FakeHelper
end
