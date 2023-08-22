module AuthorizationHelpers
   def login_as_patient(patient)
     cookies[:patient_id] = patient.id
   end
end
