class ScrobblerController < ApplicationController
  
  def scrobble
  end
  
  def status
    @file = Logfile.find(params[:id])
  end
 
  def processing
    render json: { status: @file.status }
  end
  
end