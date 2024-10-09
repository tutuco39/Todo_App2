class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: [:index, :create, :show, :edit, :update, :destroy]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = @board.tasks
  end

  def show
    @comments = @task.comments
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    @task = @board.tasks.build(task_params)
    @task.user = current_user
    if @task.save
      redirect_to board_tasks_path(@task.board),
                  notice: 'Taskを追加しました'
    else
      flash.now[:error] = '追加に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to board_task_path(@task.board),
      notice: 'taskを更新しました'
    else
      flash.now[:error] = '更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy!
    redirect_to board_tasks_path(@board), notice: 'taskを削除しました'
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_task
    @task = @board.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(
      :title, :description, :deadline, :eyecatch
      )
  end

end
