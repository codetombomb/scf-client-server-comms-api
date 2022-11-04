20.times do 
    u = User.create(
        username: Faker::Internet.username,
        bio: Faker::Lorem.paragraph(sentence_count: 2),
        email: Faker::Internet.email
    )
    5.times do
        title = Faker::Book.title
        author = Faker::Book.author
        b = Book.create(
            title: title, 
            author: author,
            description: Faker::Lorem.paragraph(sentence_count: 2),
            cover_image_url: "https://orly-appstore.herokuapp.com/generate?title=#{title}&top_text=#{title}&author=#{author}&image_code=#{rand(1...10)}&theme=#{rand(1...10)}&guide_text=&guide_text_placement=bottom_right"
        )
        u.books << b
    end
end