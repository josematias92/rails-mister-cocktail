class DosesController < ApplicationController
  def create
    @cocktail = Cocktail.new
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktail/show'
    end
  end
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end
  def dose_params
    @dose.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
