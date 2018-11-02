class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
  end


  def show
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
    @gossip = Gossip.new(gossip_params)
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
        result[:user_id] = @current_user.id
        return result
      end
  end

