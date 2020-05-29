# coding: utf-8

User.create!( name: "管理者",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              
10.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!( name: name,
                email: email,
                password: password,
                password_confirmation: password)
end

3.times do |u|
  @user = User.find(u+1)
  2.times do |t|
    task_name = "task#{t+1}"
    task_content = Faker::Lorem.sentence(5)
    Task.create!(name: task_name,
                 content: task_content,
                 user_id: @user.id)
  end
end
