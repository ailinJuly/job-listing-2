class FavoriteController < ApplicationController

  def index
@jobs = current_user.favorite_jobs.paginate(:page => params[:page], :per_page => 5 )

end
end
