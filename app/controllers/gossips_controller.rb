class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
  end


  def show
    @gossip = Gossip.find(params[:id])
    @comments = @gossip.comments.order(:created_at)
  end


  def new
    @gossip = Gossip.new
    unless @current_user
      redirect_to(not_connected_path)
  end

  def edit
    @gossip = Gossip.find(params[:id])
    unless @current_user == @gossip.user 
      redirect_to(not_connected_path)
    end
  end

 
  def create
    @gossip = Gossip.create(gossip_params)
    redirect_to(gossip_path(gossip.id))
  end


  def update
    gossip = Gossip.find(params[:id])
    gossip.update(gossip_params)
    redirect_to(gossip_path(gossip.id))
  end


  def destroy
    gossip = Gossip.find(params[:id])
    gossip.destroy
    redirect_to(gossips_path)
    end
  end

  def home
  end

  private
  
      def gossip_params
        result = params.require(:gossip).permit(:content, :author)
      end
  end

