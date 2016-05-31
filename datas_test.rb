Author.create(
    name: "Pierre 'Kayyow' Marchal",
    link: "http://codepen.io/Kayyow"
)

(1..12).each do
    Post.create(
        title: Faker::Hipster.sentence,
        description: Faker::Company.catch_phrase,
        content: "<p>#{ Faker::Lorem.paragraph(5 + Random.rand(8)) }</p>" * (2 + Random.rand(5)),
        cover_image: 'https://unsplash.it/1920/1080/?random', #Faker::Avatar.image("blablabla", "1920x1080"),
        author_id: 1
    )
end

Post.all.each do |post|
    (1..Random.rand(1..7)).each do
        post.comments.create(
            name: Faker::Name.name,
            email: Faker::Internet.email,
            message: Faker::Lorem.paragraph
        )
    end
end