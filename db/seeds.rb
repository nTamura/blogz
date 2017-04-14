# @posts = Post.all

100.times do
  User.create(username: Faker::Internet.user_name,
              email: Faker::Internet.email,
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              password: 'qwe',
              password_confirmation: 'qwe')
end
puts 'Users generated!'

User.create(username: 'Nic',
            email: 'nic@gmail.com',
            first_name: 'Nic',
            last_name: 'Tamura',
            password: 'qwe',
            password_confirmation: 'qwe')
puts 'User Nic created!'

User.create(username: 'Admin',
            email: 'admin@gmail.com',
            first_name: 'Admin',
            last_name: 'Admin',
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

Post.all.each do |post|
  rand(4..10).times do
    user = User.all.sample
    post.comments.create(
      # username: Faker::Internet.user_name,
      body: Faker::ChuckNorris.fact,
      user_id: user.id
    )
  end
end
puts 'Comments generated'
