class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board
  before_action :set_task
  before_action :set_comment, only: [:show]

  def new
    @comment = @task.comments.build
  end

  def create
    @comment = @task.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to board_task_path(@board, @task),
                  notice: 'Commentを追加しました'
    else
      flash.now[:error] = '追加に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
    @comments = @task.comments
  end

  private
  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_task
    @task = @board.tasks.find(params[:task_id])
  end

  def set_comment
    @comment = @task.comments.find(params[:comment_id])
  end

  def comment_params
    params.require(:comment).permit(
      :content
    )
  end

end