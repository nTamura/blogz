@posts = Post.all
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


# posts.each do |p|
#   rand(0..10).times do
#     p.comments.create({
#       body: Faker::RickAndMorty.quote
#       })
#   end
# end


puts "#{posts}"
