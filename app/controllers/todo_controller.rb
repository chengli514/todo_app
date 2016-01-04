class TodoController < ApplicationController
  def index
    @todos = Todo.all
    @todo = Todo.new
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
    @todo = Todo.new(params.require(:todo).permit(:title))
    @todo.is_top_level = true
    if @todo.save
      redirect_to todo_index_path
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
    parent_todo = @todo.parent
    @todo.destroy
  
    if parent_todo
      redirect_to parent_todo
    else
      redirect_to todo_index_path
    end
  end

  def new_child 
    @todo = Todo.new
    @parent_todo_id = params[:id]
  end

  def create_child
    @todo = Todo.new(params.require(:todo).permit(:title))
    @todo.parent = Todo.find(params[:id])
    @debug = @todo
    if @todo.save
      redirect_to @todo.parent
    else
      render 'new_child'
    end
  end

  def set_as_done
    @todo = Todo.find(params[:id])
    @todo.is_done = true
    @todo.save
    if @todo.parent
      redirect_to @todo.parent
    else
      redirect_to root_path
    end
  end

  def set_as_not_done
    @todo = Todo.find(params[:id])
    @todo.is_done = false
    @todo.save
    if @todo.parent
      redirect_to @todo.parent
    else
      redirect_to root_path
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:title)
  end
end
