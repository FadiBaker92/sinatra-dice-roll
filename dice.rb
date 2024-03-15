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
  erb(:elephant)
end


get("/dice/2/6") do
  @roll = []
  2.times do
    dice = rand(1..6)
    @roll.push(dice)
  end

  erb(:two_six)
end

get("/dice/2/10") do 
  @roll = []
  2.times do 
    dice = rand(1..10)
    @roll.push(dice)
  end

  erb(:two_ten)
end

  get("/dice/1/20") do
    @roll = []
    1.times do   
      dice = rand(1..20)
      @roll.push(dice)
    end
    
   erb(:one_twenty)
  end

  get("/dice/5/4") do 
    @roll = []
    5.times do
      dice = rand(1..4)
      @roll.push(dice)
    end

    erb(:five_four)
  end

  get("/dice/100/6") do
    @rolls = []
    100.times do 
      dice = rand(1..6)
      @rolls.push(dice)
    end

    erb(:one_hundred_six)
  end
