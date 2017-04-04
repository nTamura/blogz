posts = Post.all
# answers_count = Answer.count

100.times do
  Post.create({ title: Faker::Book.title,
                body: Faker::ChuckNorris.fact,
                # view_count: rand(200)
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
