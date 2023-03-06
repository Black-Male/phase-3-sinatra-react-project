puts "🌱 Seeding data..."

5.times do
    user = User.create(
        name: Faker::Name.name,
    )

    rand(5..10).times do
        Task.create(
            task_details: Faker::Lorem.sentence(word_count: 3),
            due_date: Faker::Date.between(from: 15.days.ago, to:10.days.from_now),
            done: Faker::Boolean.boolean(true_ratio: 0.3),
            user_id: User.pluck(:id).sample
        )
    end
end