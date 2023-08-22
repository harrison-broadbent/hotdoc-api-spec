require 'rails_helper'

RSpec.describe "Appointments", type: :request do

  let(:test_patient) { Patient.create!(name: "Mr. Test") }
  let(:test_clinic) { Clinic.create!(name: "Test Clinic")}

  describe "GET /index" do
    it "returns http success" do
      login_as_patient(test_patient)
      get "/appointments"

      expect(response.status).to eq(200)
    end

    it "returns all the patients appointments" do
      appointment_1 = Appointment.create!(start_time: Time.now, end_time: Time.now + 1.hour, patient: test_patient, clinic: test_clinic)
      appointment_2 = Appointment.create!(start_time: Time.now + 1.hour, end_time: Time.now + 2.hour, patient: test_patient, clinic: test_clinic)

      login_as_patient(test_patient)
      get "/appointments"

      parsed_body = JSON.parse(response.body)
      expect(parsed_body.length).to eq(2)
    end

    it "dosn't return anyone else's appointments" do
      our_appointment = Appointment.create!(start_time: Time.now, end_time: Time.now + 1.hour, patient: test_patient, clinic: test_clinic)

      other_patient = Patient.create!(name: "Other Patient")
      other_appointment = Appointment.create!(start_time: Time.now + 1.hour, end_time: Time.now + 2.hour, patient: other_patient, clinic: test_clinic)

      login_as_patient(test_patient)
      get "/appointments"

      parsed_body = JSON.parse(response.body)
      expect(parsed_body.length).to eq(1)
    end

    it "includes the clinic name in the response" do
      our_appointment = Appointment.create!(start_time: Time.now, end_time: Time.now + 1.hour, patient: test_patient, clinic: test_clinic)

      login_as_patient(test_patient)
      get "/appointments"

      parsed_body = JSON.parse(response.body)
      expect(parsed_body[0]["clinic"]["name"]).to eq(test_clinic.name)

    end
  end
end
