(1..12).each do
  Post.create
    title: Faker::Hipster.sentence,
    description: Faker::Company.catch_phrase,
    content: "<p>" + Faker::Lorem.paragraph(6) + "</p>",
    cover_image: Faker::Avatar.image("blablabla", "1920x1080"),
    author_id: 1
end