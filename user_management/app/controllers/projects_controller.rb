class ProjectsController < ApplicationController
	def new
		@project=Project.new	
	end

	def create
		# binding.pry
		@project= Project.new(project_params)
		@project.save
	# 	if @user.save
	# 	redirect_to users_list_path
	# else
	# 	render 'new'
	# end
	# end

end
	private

 		def project_params
 			params.require(:project).permit(:name,:duration,:teamsize,:cost,:domain)
 		end
end
