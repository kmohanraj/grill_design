class WindowsController < ApplicationController
  
      # before_action :authenticate_user!


  def index
  	@window = Window.all
  end

  def new
  	@window = Window.new
  end

  def create
  	p "11111111111"
  	@window = Window.new(windows_params)
  	p @window
  	p "11111111111"
  	if @window.save
  		flash[:notic] = "successfully created"
  		redirect_to :controller =>"windows", :action =>"index"
  	else
  		flash[:notic] = "form is invalid"
 		render 'new'
  	end
  end


  def edit
  	@window = Window.find(params[:id])
  end

  def show
    @window = Window.find(params[:id])
  end

  def update
  	@window = Window.find(params[:id])
  	p params[:window] 
  	p "======================================"
  		if @window.update_attributes(params[:window])
  			flash[:notice] = "Zones was Updated."
  		  redirect_to :controller => "windows", :action => "index"
      else
        flash[:notice] = "invalid"
        render 'show'
      end
  end

  # def update
  #     	p (params[:id])
  #     	p ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  #       @window = Window.find(params[:id])
	 #    if @window.update_attributes(params[:window])
	 #      flash[:notice] = "Successfully updated."
	 #      redirect_to :controller => "windows", :action => "index"
	 #     else
	 #     	p "//////////////////////////////////////////////////"
	 #     	flash[:notice] = "invalid"
	 #   		render "edit"
 	#     end
  # 	end

  def destroy
    	@window = Window.find(params[:id])
    	@window.destroy
    	flash[:notice] = "successfully deleted"

    	redirect_to :controller => "windows" , :action=> "index"
   end


  def windows_params
      params.require(:window).permit(:name, :title, :description, :size, :model, :price, :image)
  end 


end

