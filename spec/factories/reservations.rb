# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    table '#10'
    start_at Time.now + 4.hours
    end_at Time.now + 6.hours
  end
end
