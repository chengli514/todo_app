class TodoController < ApplicationController
  def index
    @todos = Todo.all
  end
  
  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(params.require(:todo).permit(:title, :text))
    if @todo.save
      redirect_to @todo
    else
      render 'new'
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to @todo
    else
      render 'edit'
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
   
    redirect_to todo_index_path
  end

  def new_child 
    @todo = Todo.new
    @parent_todo_id = params[:id]
  end

  def create_child
    @debug = {}
    title = params[:todo][:title]
    text = params[:todo][:text]
    parent_id = params[:id]
    @debug[:title] = title
    @debug[:text] = text
    @debug[:parent_id] = parent_id
    #@todo = Todo.new(params.require(:todo).permit(:title, :text))
    #if @todo.save
    #  redirect_to @todo
    #else
      #TODO
    #  assert(false)
    #end
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :text)
  end
end
