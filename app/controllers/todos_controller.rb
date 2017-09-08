class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :show, :destroy]

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "todo was created successfully"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end

  def index
    # render 'new'
    @todos = Todo.all
  end

  def show
  end

  def edit
  end

  def destroy
    if @todo.destroy
      flash[:notice] = "Todo was successfully deleted"
      redirect_to todos_path
    else
      flash[:notice] = "Error occured while deleting todo"
    end
  end

  def update
    if @todo.update(todo_params)
      flash[:notice] = "Todo was successfully updated"
      redirect_to todo_path(@todo)
    else
      render "edit"
    end
  end

  private

    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:name, :description)
    end

end
