## FybberOfferChallenge
- Removal of ActiveMailer and ActiveModel along with the database from Rails since they wont be needed for this app
- Use a single page style since it wasn't necesary to render any diferent view since all that changes in the view are the  offers and this can be handles with Javascript without problem.
- Even if the Fyber API says that the ERROR_INVALID_PAGE is related to a HTTP 400 error. When you receive and ERROR_INVALID_PAGE it actually gives you a HTTP 200 success most of the time and sometimes it starts giving an HTTP 400. So the handling of the server response was based on the Fyber Api code response instead of the HTTP
- The acceptance tests are buggy and should be improved.





