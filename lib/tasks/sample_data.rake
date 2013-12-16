namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@example.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    users = User.all(limit: 1)
    40.times do
      name = Faker::Lorem.sentence(1)
      users.each { |user| user.groups.create!(
        name:   name,
        limit:  "£10",
        year:   "2013"
        ) }
    end
  end
end
