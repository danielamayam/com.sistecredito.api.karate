Feature: LLamando al endpoint Upload

  Como Qa automatizador
  Quiero ejecutar este reto
  Para validar este endpoint

  Background:
    * configure charset = null
    Given url "http://localhost:5002/api/"
    And header Authorization = 'Basic YWRtaW46YWRtaW4='
    And header Content-Type = 'multipart/form-data'

  @postUpload
  Scenario: Usuario carga una imagen POST
    Given path "upload"
    And multipart file file = { read: 'imagen.png', filename: 'imagen.png', contentType: 'application/octet-stream' }
    When method post
    Then status 201