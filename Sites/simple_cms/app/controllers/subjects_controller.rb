class SubjectsController < ApplicationController
  
  layout false
  
  def index
	@subjects = Subject.sorted
  end

  def show
	@subject = Subject.find(params[:id])
  end

  def new
	@subject = Subject.new({:name => "Default"})
  end
  
  def create
	#Instantiate a new object
	@subject = Subject.new(subject_params)
		if @subject.save #save the object
			redirect_to(:action => 'index') #redirect to the index page
		else
			render('new') #if save fails, allow the user to update info
		end
  end

  def edit
  end

  def delete
  end
  
  private 
	def subject_params
		params.require(:subject).permit(:name, :position, :visible)
	end
end
