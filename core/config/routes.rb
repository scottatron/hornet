Rails.application.routes.draw do
  get '/images/:id' => Dragonfly.app.endpoint { |params, app|
    image = Image.find(params[:id])
    if params[:size]
      app.fetch(image[:file_uid]).thumb(params[:size])
    else
      app.fetch(image[:file_uid])
    end
  }
end
