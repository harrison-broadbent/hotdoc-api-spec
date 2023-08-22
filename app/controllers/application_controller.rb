class ApplicationController < ActionController::API
  include ActionController::Cookies

  def current_patient
    Patient.find_sole_by(id: cookies[:patient_id])
  end
end
