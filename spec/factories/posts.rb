FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Lorem ipsum"
  end
  
  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Lorem ipsum dor sit amet"
  end
end