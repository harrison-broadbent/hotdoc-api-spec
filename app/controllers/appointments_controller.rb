class AppointmentsController < ApplicationController
  def index
    render json: current_patient.appointments.as_json(include: :clinic), status: 200
  end
end
