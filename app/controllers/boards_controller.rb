class BoardsController < ApplicationController

  def new
    @board = current_user.boards.build
  end
  def index
    @board = Board.first
  end
end
