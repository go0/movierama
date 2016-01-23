module FakeHelper
  def self.movie
    Movie.create(
      title:        'Empire strikes back',
      description:  'Who\'s scruffy-looking?',
      date:         '1980-05-21',
      user:         author,
      liker_count: 10,
      hater_count: 10
    )
  end

  def self.user
    User.create(
      uid:  'null|12345',
      name: 'Bob',
      email: 'bob@gxmail.com'
    )
  end

  def self.author
    User.create(
      uid:  'null|12346',
      name: 'James',
      email: 'james@gxmail.com'
    )
  end
end
