class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  get '/landmarks/new' do
    erb :"/landmarks/new"
  end

  post '/landmarks' do
    @landmark = Landmark.create(params)
    redirect to "/landmarks/#{@landmark.id}"  #redirect to
  end

end
