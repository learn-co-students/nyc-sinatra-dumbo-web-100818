class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    erb :"/figures/new"
  end

   post '/figures' do
     @figure = Figure.create(params[:figure])
     binding.pry
     Landmark.create(params[:landmark], figure_id: @figure.id)
     redirect to "figures/#{@figure.id}"
   end

   get '/figures/:id' do
     @figure = Figure.find(params[:id])
     erb :"/figures/show"
   end







end
