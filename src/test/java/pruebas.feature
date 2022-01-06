Feature: Pruebassss

  Background:
    * call read('../configurations.feature')
    * configure headers = confHeaders['headersValid']
    * def pathBody = '../../data/body_pruebas.json'
    * def body = read(pathBody)
    * url baseUrl
    * configure ssl = true

# Post scenario with Background
  Scenario: Post demo 1
    Given path '/users'
    And header Content-Type = ''
    And request { "name": "DanielC", "job": "QA"}
    When method POST
    Then status 201
    * print responseHeaders['Content-Type'][0]
    And def temp = responseHeaders['Content-Type'][0]
    Then match temp contains 'application/json;'
    Then match temp contains 'charset=utf-8'
    Then match temp !contains 'test-version=1'
    Then match resp !contains respuesta
    * print responseTime
    * print responseCookies


  Scenario: Post demo 2
    Given path '/users'
    And header Content-Type = ''
    And request body['case2']
    When method post
    Then status 201
    * print response
    * print responseHeaders['Content-Type'][0]
    * def temp = responseHeaders['Content-Type'][0]
    Then match temp contains 'application/json;'
    Then match temp contains 'charset=utf-8'
    Then match temp !contains 'test-version=1'
    * print responseTime
    * print responseCookies
#    #Asignar a una variable
#    * def phoneCode = body['<cases>'].telefono[0].telefonoLocal = number
#    #Asignar a un Json
#    * response['<responses>'].correoEletronico[0].email = email
#    * def wait = async function(){ await delay(60);}
#    * wait()
#    #Validaciones contains deep
#    Then match response.phone contains deep response['<responses>'].phone
