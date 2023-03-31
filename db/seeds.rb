puts 'Seeding 🦸🏿‍♂️🦸🏿‍♀️...'
10.times do
  Hero.create([{ name: Faker::Name.name, super_name: Faker::Superhero.name }])
end

puts 'Seeding 💪🏿...'
20.times do
  Power.create(
    [
      {
        name: Faker::Superhero.power,
        description: Faker::Quote.yoda,
      },
    ],
  )
end

puts 'Seeding 🦸🏿‍♂️💪🏿...'
10.times do
  HeroPower.create(
    [{ strength: %w[Strong Weak Average].sample, hero_id: rand(1..10), power_id: rand(1..20) }],
  )
end