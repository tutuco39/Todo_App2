class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: [:index, :create]

  def index
    @tasks = @board.tasks
  end

  def show
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    @task = @board.tasks.build(task_params)
    @task.user = current_user
    if @task.save!
      redirect_to board_tasks_path(@board),
                  notice: 'Taskを追加しました'
    else
      flash.now[:error] = 'Taskの追加に失敗しました'
      render :new
    end
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def task_params
    params.require(:task).permit(
      :title, :description, :deadline, :eyecatch
      )
  end

end
