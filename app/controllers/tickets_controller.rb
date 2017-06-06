# TicketsController
class TicketsController < ApplicationController
  before_action :set_departament
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def new
    @ticket = @departament.tickets.build
  end

  def create
    @ticket = @departament.tickets.build(ticket_params)
    @ticket.author = current_user

    if @ticket.save
      flash[:notice] = 'Ticket successfully created'
      redirect_to [@departament, @ticket]
    else
      flash.now[:alert] = 'Ticket has not been created'
      render 'new'
    end
  end

  def show
    authorize @ticket, :show?
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = 'Ticket successfully updated'
      redirect_to [@departament, @ticket]
    else
      flash.now[:alert] = 'Ticket has not been updated'
      render 'edit'
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = 'Ticket successfully deleted'

    redirect_to @departament
  end

  private

  def set_departament
    @departament = Departament.find(params[:departament_id])
  end

  def set_ticket
    @ticket = @departament.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :description)
  end
end
