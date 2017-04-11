# @posts = Post.all

100.times do
  User.create(username: Faker::Name.first_name,
              email: Faker::Internet.email,
              password: 'qwe',
              password_confirmation: 'qwe')
end
puts 'Users generated!'

User.create(username: 'Nic',
            email: 'nic@gmail.com',
            password: 'qwe',
            password_confirmation: 'qwe')
puts 'User Nic created!'

User.create(username: 'Admin',
            email: 'admin@gmail.com',
            password: 'qwe',
            password_confirmation: 'qwe',
            is_admin: true)
puts 'Admin created!'

12.times do
  user = User.all.sample
  Post.create(
    title: Faker::Book.title,
    body: Faker::ChuckNorris.fact,
    user_id: user.id
    # view_count: rand(200)
    # date: Faker::Date.between(45.days.ago, Date.today)
  )
end
puts 'Posts generated'

Post.all.each do |q|
  rand(4..15).times do
    user = User.all.sample
    q.comments.create(
      # username: Faker::Name.first_name,
      body: Faker::ChuckNorris.fact,
      # user_id: user.id
    )
  end
end
puts 'Comments generated'
