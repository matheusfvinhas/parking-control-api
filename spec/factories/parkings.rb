FactoryGirl.define do
  factory :parking do
    id 1
    plate "AAA-1234"    
    paid false
    left false
    enter_at "2019-11-06 14:23:48"
    left_at "2019-11-06 14:33:48"
  end
end
