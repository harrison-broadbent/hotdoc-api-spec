A Rails 7 app in API only mode, al la Hotdoc techincal interview. I've been playing around a bit with JSON responses and request specs, since I wasn't too familiar with them.

### What's here

- Added the appointment model between patient and clinics
- See `/spec/requests/` for api specs
- Rather than Devise, theres a custom `login_as_patient` helper which just sets the patient id in the session cookie. This is used by ApplicationController to set the `current_patient`

### Requests vs Controller specs

In the interview we mentioned controller vs request specs. I didn't have a great answer so I've done some research. As of 2019, the RSpec team officially stated that **controller specs are now obsolete**, so there's that.

Request specs have the benefit of testing the controller flow, _plus_ the router + middleware + request / response stack of your app. Essentially, you can test more of the app while writing the same tests, which in most cases is an easy win.

As of Rails 5, request specs are actually _significantly faster_ than controller specs too. Essentially you can test _more_ of your app in _less_ time!
