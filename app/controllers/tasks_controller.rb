class TasksController < ApplicationController
	layout false
	def index
		@project = Project.find(params[:project_id])
		@tasks = @project.tasks
		@task = Task.new
	end
	def create
		@project = Project.find(params[:project_id])
		@task = Task.new(params[:task])
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
