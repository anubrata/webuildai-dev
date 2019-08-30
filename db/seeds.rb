# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

person_one =   Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_two  =  Participant.create(role:'admin', password: "secret", password_confirmation: "secret")
person_three = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_four = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_five = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_six = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_seven = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_eight = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_nine = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_ten = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_eleven = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_twelve = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_thirteen = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_fourteen = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_fifteen = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_sixteen = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_seventeen = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_eighteen = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_nineteen = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_twenty = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_twenty_one = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_twenty_two = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_twenty_three = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_twenty_four = Participant.create(role:'user', password: "secret", password_confirmation: "secret")
person_twenty_five = Participant.create(role:'user', password: "secret", password_confirmation: "secret")

a = Feature.create(name: "A", category: "driver", description: "Logistics")
b = Feature.create(name: "B", category: "driver", description: "Logistics")
c = Feature.create(name: "C", category: "request", description: "Speed/Efficacy")

distance1 = Feature.create(name: "The distance to the restaurant/customer's origin", category: "request", description: "Distance / Location")
distance2 = Feature.create(name: "The distance from the customer's origin to their destination (if applicable)", category: "request", description: "Distance / Location")
distance3 = Feature.create(name: "The distance from the restaurant to the delivery destination (if applicable)", category: "request", description: "Distance / Location")
distance4 = Feature.create(name: "The total distance of the driver's entire trip", category: "request", description: "Distance / Location")
tip1 = Feature.create(name: "How often the customer tips their drivers", category: "request", description: "Customer Tipping")
tip2 = Feature.create(name: "The average monetary amount the customer tips for each ride/delivery", category: "request", description: "Customer Tipping")
feedback1 = Feature.create(name: "The customer's rating of their most recent driver", category: "request", description: "Customer Feedback")
feedback2 = Feature.create(name: "The average rating the customer gives their drivers", category: "request", description: "Customer Feedback")
usage1 = Feature.create(name: "How frequently the customer uses the company's app", category: "request", description: "Customer's App Usage")
usage2 = Feature.create(name: "How long the customer has had an account with the company's app", category: "request", description: "Customer's App Usage")
cancellation1 = Feature.create(name: "The number of requests the customer has cancelled today", category: "request", description: "Customer’s Cancellation Rate")
cancellation2 = Feature.create(name: "The number of requests the customer has cancelled since they first started", category: "request", description: "Customer’s Cancellation Rate")

data_range_1 = DataRange.create(feature_id: a.id, is_categorical: true)
data_range_2 = DataRange.create(feature_id: b.id, is_categorical: false, lower_bound: 0, upper_bound: 10)
data_range_3 = DataRange.create(feature_id: c.id, is_categorical: false, lower_bound: 1, upper_bound: 25)

data_range_distance1 = DataRange.create(feature_id: distance1.id, is_categorical: false, lower_bound: 0, upper_bound: 70)
data_range_distance2 = DataRange.create(feature_id: distance2.id, is_categorical: false, lower_bound: 0, upper_bound: 70)
data_range_distance3 = DataRange.create(feature_id: distance3.id, is_categorical: false, lower_bound: 0, upper_bound: 70)
data_range_distance3 = DataRange.create(feature_id: distance4.id, is_categorical: false, lower_bound: 0, upper_bound: 140)

cat_dat_opt_1 = CategoricalDataOption.create(data_range_id: data_range_1.id, option_value: "Apple")
cat_dat_opt_2 = CategoricalDataOption.create(data_range_id: data_range_1.id, option_value: "Bannana")
cat_dat_opt_3 = CategoricalDataOption.create(data_range_id: data_range_1.id, option_value: "Orange")



scenario_1_a = Scenario.create(group_id: 1, feature_id: a.id, feature_value: "Apple")
scenario_1_b = Scenario.create(group_id: 1, feature_id: b.id, feature_value: "10")
scenario_1_c = Scenario.create(group_id: 1, feature_id: c.id, feature_value: "3")

scenario_2_a = Scenario.create(group_id: 2, feature_id: a.id, feature_value: "Bannana")
scenario_2_b = Scenario.create(group_id: 2, feature_id: b.id, feature_value: "5")
scenario_2_c = Scenario.create(group_id: 2, feature_id: c.id, feature_value: "20")

scenario_3_a = Scenario.create(group_id: 3, feature_id: a.id, feature_value: "Orange")
scenario_3_b = Scenario.create(group_id: 3, feature_id: b.id, feature_value: "4")
scenario_3_c = Scenario.create(group_id: 3, feature_id: c.id, feature_value: "21")
