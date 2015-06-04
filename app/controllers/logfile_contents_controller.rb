class LogfileContentsController < ApplicationController
  def create
    @logfile = Logfile.new(file_name: params[:file])
    if @logfile.save!
	  respond_to do |format|
	    format.json{ render :json => @logfile }
	  end
    end
  end
end