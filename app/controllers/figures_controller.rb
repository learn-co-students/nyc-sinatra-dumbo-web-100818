class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  post '/figures' do
    figure = Figure.create(params[:figure])
    title = Title.create(params[:title])
    FigureTitle.create(figure: figure, title: title)
    figure.landmarks << Landmark.create(params[:landmark])
  end

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id:params[:id])
    @landmarks = @figure.landmarks
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id:params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/edit"
  end

  patch '/figures/:id' do
    figure = Figure.find_by(id:params[:id])
    figure.update(params[:figure])
    figure.landmarks << Landmark.create(params[:landmark])
    redirect "/figures/#{figure.id}"
  end



end
