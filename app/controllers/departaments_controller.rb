# DepartamentsController class
class DepartamentsController < ApplicationController
  before_action :set_departament, only: [:show, :edit, :update, :destroy]

  def index
    @departaments = policy_scope(Departament)
  end

  def show
    authorize @departament, :show?
  end

  def edit
    authorize @departament, :update?
  end

  def update
    authorize @departament, :update?
    if @departament.update(departament_params)
      flash[:notice] = 'Departament successfully updated'
      redirect_to @departament
    else
      flash.now[:alert] = 'Departament has not been updated'
      render 'edit'
    end
  end

  private

  def departament_params
    params.require(:departament).permit(:name, :description)
  end

  def set_departament
    @departament = Departament.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The departament you were looking for cannot be found!'
    redirect_to departaments_path
  end
end
