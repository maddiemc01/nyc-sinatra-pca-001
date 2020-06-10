class FiguresController < ApplicationController
  # add controller methods
  get "/figures" do
    @figures = Figure.all
    erb :"figures/index"
  end

  get "/figures/new" do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  post "/figures" do
    figure = Figure.create(params[:figure])
    if params[:title].present?
      title = Title.create(params[:title])
      figure.titles << title
    end
    if params[:landmark].present?
      landmark = Landmark.create(params[:landmark])
      figure.landmarks << landmark
    end
    redirect to "figures/#{figure.id}"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/edit"
  end

  patch "/figures/:id" do
    figure = Figure.find_by_id(params[:id])
    figure.update(params[:figure])
    if params[:title].present?
      title = Title.create(params[:title])
      figure.titles << title
    end
    if params[:landmark].present?
      landmark = Landmark.create(params[:landmark])
      figure.landmarks << landmark
    end
    redirect to "/figures/#{figure.id}"
  end


end
