20.times do 
    u = User.create(
        username: Faker::Internet.username,
        bio: Faker::Lorem.paragraph(sentence_count: 2),
        email: Faker::Internet.email
    )
    5.times do
        # terms = ['books', 'cover']
        # search_terms = [] 
        
        image = Faker::LoremFlickr.colorized_image(size: "500x500", search_terms: search_terms)
        b = Book.create(
            title: Faker::Book.title, 
            author: Faker::Book.author,
            description: Faker::Lorem.paragraph(sentence_count: 2),
            cover_image_url: image
        )
        u.books << b
    end
end