module RailsCastsChina
  module APIEntities
    class User < Grape::Entity
      expose :id, :name 
      expose(:email) do |model, opts|
        model.email || ''
      end
    end

    class Episode < Grape::Entity
      expose :id, :name, :description
      expose :user, using: APIEntities::User
    end

    class Comment < Grape::Entity
      expose :id, :content
      expose :user, using: APIEntities::User
      expose :episode, using: APIEntities::Episode
    end
  end
end
