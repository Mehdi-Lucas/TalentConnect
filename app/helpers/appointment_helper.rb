module AppointmentHelper
  private
  def is_user_both_apprentice_and_mentor?
    @talent = Talent.find_by(id: params[:talent_id])
    unless @talent.nil?
      if user_signed_in?
        unless current_user.id != @talent.user_id
          flash[:danger] = "Tu ne peux pas créer un rendez-vous avec toi même!"
          redirect_to root_path
        end
      end
    end
  end

  def user_have_info?
    if current_user.first_name.nil?
      flash[:alert] = "Pour utiliser cette fonctionalité, tu dois renseigner au moins ton prénom."
      redirect_to edit_user_registration_path
    end
  end

  def count_notifications
    Appointment.where(apprentice_id: current_user.id, is_mentor_validate: true, is_paid: false).count + Appointment.where(mentor_id: current_user.id, is_mentor_validate: false).count
  end
end
