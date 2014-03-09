class ProjectsController < ApplicationController
	def index
		@projects = Project.all
		@project = Project.new
	end
	def create
		@project = Project.new(params[:project])
		if @project.save
			redirect_to projects_path
		else
			flash[:danger] = @project.errors
			render 'index'
		end
	end
	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(params[:project])
			redirect_to projects_path
		else
			flash[:danger] = @project.errors
			render 'index'
		end
	end
	def destroy
		Project.find(params[:id]).destroy
		redirect_to projects_path
	end
end
