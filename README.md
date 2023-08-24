A Rails 7 app in API only mode, al la Hotdoc techincal interview. I've been playing around a bit with JSON responses and request specs, since I wasn't too familiar with them.

### What's here

- Added the appointment model between patient and clinics
- See `/spec/requests/` for api specs
- Rather than Devise, theres a custom `login_as_patient` helper which just sets the patient id in the session cookie. This is used by ApplicationController to set the `current_patient`
