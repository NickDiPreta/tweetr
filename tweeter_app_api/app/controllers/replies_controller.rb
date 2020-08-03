class RepliesController < ApplicationController
  def index
    replies = Reply.all
    render json: { status: 200, replies: replies }
  end

  def show
    puts "show route: params #{params}"
    replies = Reply.find(params[:id])
    render json: { status: 200, reply: reply }
  end
end
