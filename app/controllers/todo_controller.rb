class TodoController < ApplicationController
  def new
  end

  def create
    @todo = Todo.new(params.require(:todo).permit(:title, :text))
    @todo.save
    redirect_to @todo
  end

  def show
    @todo = Todo.find(params[:id])
  end
end
