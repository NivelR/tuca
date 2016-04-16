class MainController < ApplicationController
  def index
  	# if params[:email] != "" 
  	# 	set_record
  	# end
    @record = Record.find_by(email: params[:email])

    if @record
    # redirect_to  record_path @record if @record
    data = open(@record.image.expiring_url(30.minutes.since, :original)) { |f| f.read }
    # binding.pry
    send_data(
      data,
      type: "image/jpg"
    )
    end
    
  end

   private
    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:email)
    end
end
