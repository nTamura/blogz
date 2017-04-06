@posts = Post.all
@comments = Comment.all
posts = Post.all
@users = User.all
# answers_count = Answer.count

30.times do
  User.create(username: Faker::Name.first_name,
              email: Faker::Internet.email,
              password: '1234',
              password_confirmation: '1234'
  )
  puts "#{User} created!"
end

12.times do
  Post.create({ title: Faker::Book.title,
                body: Faker::ChuckNorris.fact
                # view_count: rand(200)
                # date: Faker::Date.between(45.days.ago, Date.today)
              })
end


Post.all.each do |q|
  rand(1..15).times do
    q.comments.create({
      username: Faker::Name.first_name,
      body: Faker::ChuckNorris.fact
      })
  end
end
