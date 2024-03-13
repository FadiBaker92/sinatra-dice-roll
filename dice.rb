require 'sinatra'
require 'sinatra/reloader'
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/hello") do 
  
  return "Hello, world!"
end

get("/") do 
  erb(:elephant , {:layout => :wrapper})
end


get("/dice/2/6") do
  first_dice = rand(1..6)
  second_dice = rand(1..6)
  sum = first_dice + second_dice
  @outcome = "You rolled #{first_dice} and #{second_dice} and the sum is #{sum}"
  erb(:two_six, {:layout => :wrapper})
end

get("/dice/2/10") do 
  first_dice = rand(1..10)
  second_dice = rand(1..10)
  sum = first_dice + second_dice
  @outcome = "You rolled #{first_dice} and #{second_dice} and the sum is #{sum}"
  erb(:two_ten, {:layout => :wrapper})
end

  get("/dice/1/20") do
    first_dice = rand(1..20)
    @outcome = "You rolled #{first_dice}"
   erb(:one_twenty, {:layout => :wrapper})
  end

  get("/dice/5/4") do 
    dice_1 = rand(1..4)
    dice_2 = rand(1..4)
    dice_3 = rand(1..4)
    dice_4 = rand(1..4)
    dice_5 = rand(1..4)
    sum = dice_1 + dice_2 + dice_3 + dice_4 + dice_5
    @outcome = "You rolled #{dice_1}, #{dice_2}, #{dice_3}, #{dice_4} and #{dice_5} and the sum is #{sum}"
    erb(:five_four, {:layout => :wrapper})

  end
