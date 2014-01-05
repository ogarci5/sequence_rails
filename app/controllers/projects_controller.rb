class ProjectsController < ApplicationController
	def index
		@projects = Project.all
		@project = Project.new
	end
	def create
		@project = Project.new
		if @task.save
			@project.tasks << @task
			redirect_to projects_path
		else
			flash[:error] = @task.errors
			render project_tasks_path(@project)
		end
	end
	def update
		@project = Project.find(params[:project_id])
		@task = Task.find(params[:id])
		if @task.update_attributes(params[:task])
			redirect_to projects_path
		else
			flash[:error] = @task.errors
			render project_tasks_path(@project)
		end
	end
	def destroy
		Task.find(params[:id]).destroy
		redirect_to projects_path
	end
end
