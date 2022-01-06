Feature:Sample karate test script for a soap service with countrys

  Background:
    * url 'http://webservices.oorsprong.org/websamples.countryinfo/CountryInfoService.wso'

  Scenario: GET List Countrys of service
    Given request
    """
   <?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:web="http://www.oorsprong.org/websamples.countryinfo">
      <soap:Header/>
        <soap:Body>
            <web:ListOfCountryNamesByCode/>
        </soap:Body>
    </soap:Envelope>
    """
    When soap action 'GET'
    Then status 200
    * print '\n DANIEL', response


  Scenario Outline: GET List Countrys of service with id
    Given request
    """
  <?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:web="http://www.oorsprong.org/websamples.countryinfo">
    <soap:Header/>
    <soap:Body>
      <web:CountryName>
         <web:sCountryISOCode><code></web:sCountryISOCode>
      </web:CountryName>
   </soap:Body>
</soap:Envelope>
    """
    When soap action 'GET'
    Then status 200
    * print '\n DANIEL', response
    * def lloralo = /Envelope/Body/CountryNameResponse/CountryNameResult
    * match response /Envelope/Body/CountryNameResponse/CountryNameResult == "<expected>"

    Examples:
      | code | expected |
      | AD   | Andorra  |
      | CA   | Canada   |
