class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Overriding devise defaults on sign in
  	def after_sign_in_path_for(resource_or_scope)
 		offices_path
	end

	
end
