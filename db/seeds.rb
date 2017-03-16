# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "开始创建管理员账户"
User.create!(:email => "leichaofan2024@gmail.com", :password => "123456", :password_confirmation => "123456",:is_admin => true)
puts "管理员创建完成！"


puts "开始创建工作。。。"
for i in 1..10 do
  Job.create!(title: "第#{i}份工作", description: "我们有共同的梦想，有共同的追求，让我们一起奋斗吧，只差趣味相投的你！",
  wage_upper_bound: rand(6000..12000), wage_lower_bound: rand(3500..6000), contact_email: "#{i}*100@#{i}*200.com")
end
puts "成功创建10个工作！"
