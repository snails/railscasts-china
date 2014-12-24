require 'entities'
require 'helpers'

module RailsCastsChina
  class API < Grape::API
    prefix "api"
    version "v1"
    format :json
    content_type :json, "text/plain;charset=utf-8"

    helpers APIHelpers

    # Authentication:
    # APIs marked as 'require authentication' should be provided the user's private token,
    # either in post body or query string, named "token"

    resource :episodes do 
      # Get published episodes list
      # params[:page]
      # params[:per_page]: default is 10
      # Example
      # /api/v1/episodes.json?page=1&per_page=10
      get do 
        @episodes = Episode.all.includes(:user).paginate(page: params[:page], per_page: params[:per_page] || 10)
        present @episodes, with: APIEntities::Episode
      end

      # Get published topics of the specified one
      # params[:id]: episode id (not integer one, it means the resource uri)
      # other params are same to those of topics#index
      # Example
      # /api/v1/episodes/git-init.json
      get ":id" do
        @episode = Episode.published.includes(:user).find_by(permalink: params[:id].to_s)
        present @episode, with: APIEntities::Episode
      end

      # Create a new episode, the user must be admin, or it won't do 
      # require authentication 
      # params:
      #   name 
      #   permalink: it appears in the uri
      #   description 
      #   notes 
      #   seconds  
      #   still #the image of upload. it's a file, must be encoded with base64
      #   publish: boolean, whether it's published
      #   video_url 
      #   download_url 
      #   allow_download: boolean 
      #   allow_comment: boolean
      post do 
        authenticate!
        if current_user.admin?
          @episode = current_user.episodes.build(params)
          if @episode.save
            present @episode, with: APIEntities::Episode
          else
            error!({error: @episode.errors.full_messages}, 400)
          end
        else
          error!({error: '401 Not Authenticated'}, 401)
        end
      end
      
    end
  end
end
