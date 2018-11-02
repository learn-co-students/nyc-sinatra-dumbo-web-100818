require "pry"
class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end


  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do

    @figure = Figure.create(name:params["name"])

    if params["figure"] && params["figure"]["title_ids"]
      params["figure"]["title_ids"].each do |title_id|
        @figure.titles << Title.find(title_id)
      end
    end

    if !params["title"].empty?
      @title = Title.create(name: params["title"]["name"])
      @figure.titles << @title
    end

    if params["figure"] && params["figure"]["landmark_ids"]
      params["figure"]["landmark_ids"].each do |landmark_id|
        @figure.landmarks << Landmark.find(landmark_id)
      end
    end

    if !params["landmark"].empty?
      @landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
      @figure.landmarks << @landmark
    end

    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id'do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end
  #update checked titles if there are checked Titles
  #push new titles onto figure collection if new title given


  patch '/figures/:id' do
    @figure = Figure.find(params["id"])
    @figure.name = params["name"]
    @figure.save

    @title_ids = params["figure"]["title_ids"]
    @title_ids.each do |title_id|
      if !@title_ids.include?(title_id)
        @figure.titles << title_id
      end
    end

    @new_title = params["title"]["name"]
    if !@new_title.empty?
      @figure.titles << @new_title
    end

    #update checked landmarks if there are check Landmarks
    @landmark_ids = params["figure"]["landmark_ids"]
    @landmark_ids.each do |landmark_id|
      if !@landmark_ids.include?(landmark_id)
        @figure.landmarks << landmark_id
      end
    end

    #push new landmarks onto figure collection if new landmark given
    @new_landmark = params["landmark"]["name"]
    if !@new_landmark.empty?
      @figure.landmarks << @new_landmark
    end

    redirect to "/figures/#{@figure.id}"
  end




end
