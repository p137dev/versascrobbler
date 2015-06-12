class LogfileContentsController < ApplicationController
  def create
    @logfile = Logfile.new(logfile: params[:file])
    if @logfile.save!
	  respond_to do |format|
	    format.json{ render :json => @logfile }
	  end
    end
  end
end