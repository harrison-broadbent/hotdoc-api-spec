# == Schema Information
#
# Table name: appointments
#
#  id         :integer          not null, primary key
#  end_time   :datetime
#  start_time :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  clinic_id  :integer          not null
#  patient_id :integer          not null
#
# Indexes
#
#  index_appointments_on_clinic_id   (clinic_id)
#  index_appointments_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  clinic_id   (clinic_id => clinics.id)
#  patient_id  (patient_id => patients.id)
#
class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :clinic
end
