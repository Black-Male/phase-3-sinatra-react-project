puts "🌱 Seeding data..."

10.times do
    thetask = Thetask.create(
        task_details: Faker::Lorem.sentence(word_count: 3),
        due_date: Faker::Date.between(from: 15.days.ago, to:10.days.from_now),
        done: Faker::Boolean.boolean(true_ratio: 0.3),
    )
end