# Admin::DepartamentController namespace
class Admin::DepartamentController < Admin::ApplicationController
  def new
    @departament = Departament.new
  end

  def create
    @departament = Departament.new(departament_params)
    if @departament.save
      flash[:notice] = 'Departament successfully created'
      redirect_to @departament
    else
      flash.now[:alert] = 'Departament has not been created.'
      render 'new'
    end
  end

  def destroy
    @departament = Departament.find(params[:id])
    @departament.destroy

    flash[:notice] = 'Departament successfully deleted'
    redirect_to departaments_path
  end

  private

  def departament_params
    params.require(:departament).permit(:name, :description)
  end
end
