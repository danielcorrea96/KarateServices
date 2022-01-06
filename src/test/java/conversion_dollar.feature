Feature:Sample karate test script for a soap service with conversion dollar

  Background:
    * url 'http://www.dataaccess.com/webservicesserver/numberconversion.wso'

  Scenario:Convert a number to dollar value
    Given request
    """
     <?xml version="1.0" encoding="utf-8"?>
<soap12:Envelope xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
  <soap12:Body>
    <NumberToDollarsResponse xmlns="http://www.dataaccess.com/webservicesserver/">
      <NumberToDollarsResult>10</NumberToDollarsResult>
    </NumberToDollarsResponse>
  </soap12:Body>
</soap12:Envelope>
    """
    When soap action 'Conversion'
    # http://www.dataaccess.com/webservicesserver/numberconversion.wso?WSDL check that soap action is balnk so any value can be passed.
    Then status 200
    * print '\n DANIEL', response
      # To print the converted value to console
   # * def temp = /Envelope/Body/NumberToDollarsResponse/NumberToDollarsResult
   # * print '\n Daniel Converted $ value is: ', temp
   #* match response /Envelope/Body/NumberToDollarsResponse/NumberToDollarsResult == 'ten dollars'

