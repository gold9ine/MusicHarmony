# js에서 쓰는 get, 가운데 컨텐츠만 바뀜
get '/myProject' do
  @new_project = Project.new
  @project = Project.all
  @source = Source.all

  erb "project/my_project".to_sym
end



get '/projectInfo' do
  erb 'project/projectInfo'.to_sym
end

post '/new_project' do
  @project = Project.new(params[:project])
  @project.save!

  redirect 'my_project'
end

get '/my_project' do
   @new_project = Project.new 
   @project = Project.all 
   @source = Source.all 
  # erb :my_project
  erb 'project/my_project'.to_sym
end

get "/project/:id/destroy" do
  @project = Project.find(params[:id])
  @project.destroy

  redirect 'my_project'
end

get '/project/:id/edit' do
  @project = Project.find(params[:id])

  # erb :editProject
  erb 'project/editProject'.to_sym
end

get '/project/:id' do
  @project = Project.find(params[:id])
  @sources = Source.all
  @comments = Comment.all

  erb 'project/projectInfo'.to_sym
end