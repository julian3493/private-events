class AtendenceController < ApplicationController
  def create
    @atendence = Atendence.new(atendence_params)

    respond_to do |format|
      if @atendence.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
      else
        format.html { redirect_to root_path }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_atendence
    @atendence = Atendence.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def atendence_params
    params.require(:atendence).permit(:atendee_id, :attended_event_id)
  end
end
