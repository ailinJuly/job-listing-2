# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


name_info= [["小黄","2个月的小猫公主","折耳"] ,["米米","5个月公猫，打过疫苗","流浪猫"] ,
["方方","2个月的小猫王子","英短"]]

puts "這個種子檔會自動建立一個admin帳號, 並且創建 10 個 public jobs, 以及10個hidden jobs"

create_account = User.create([email: 'admin@test.com', password: '123456', password_confirmation: '123456', is_admin: 'true'])
puts "Admin account created."

create_jobs = for i in 1..3 do
  job_test=name_info[rand(0..2)]

	Job.create!([title: job_test[0],description: job_test[1],  is_hidden:"false",category: job_test[2]])

end
puts "10 Public jobs created."

create_jobs = for i in 1..3 do
  job_test=name_info[rand(0..2)]

  Job.create!([title: job_test[0],description: job_test[1],  is_hidden:"true",category: job_test[2]])

end
puts "10 Hidden jobs created."
