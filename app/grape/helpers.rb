module RailsCastsChina
  module APIHelpers
   #user helpers
   def current_user 
     token = params[:token].to_s 
     @current_user ||= User.where(prviate_token: token).first
   end

   def admin?
     current_user.admin?
   end

   def authenticate!
     error!({"error" => "401 Unauthorized"}, 401) unless current_user
   end
  end
end

