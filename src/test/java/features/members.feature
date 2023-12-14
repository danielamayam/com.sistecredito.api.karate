Feature: LLamando a los endpoints de Members

  Como Qa automatizador
  Quiero ejecutar este reto
  Para validar estos endpoints

  Background:
    * def jsonResponse = read('./schemas/getMembers.json')
    * configure charset = null
    Given url "http://localhost:5002/api/"
    And header Authorization = 'Basic YWRtaW46YWRtaW4='
    And header Content-Type = 'application/json'

  @getMembers
  Scenario: Usuario lista todos los miembros Get
    Given path "members"
    When method get
    Then status 200
    And match $ == [{"id":1,"name":"Monil","gender":"Female"},{"id":2,"name":"Ramona","gender":"Female"},{"id":3,"name":"Lion","gender":"Male"},{"id":4,"name":"Shawn","gender":"Male"}]
    And match $ == jsonResponse

  @postMembers
  Scenario: Usuario registra un miembro POST
    Given path "members"
    And request {"name": "Daniel", "gender": "Male"}
    When method post
    Then status 201
    And match $.name == 'Daniel'

  @putMembers
  Scenario: Usuario actualiza un miembro PUT
    * def id = "3"
    Given path "members/" + id
    And request {"name": "Daniel", "gender": "Male"}
    When method put
    Then status 200
    And match $.msg == "Member with id " + id + " is updated successfully"
    And match $.member.name == "Daniel"

  @DeleteMembers
  Scenario: Usuario elimina un miembro DELETE
    * def id = "5"
    Given path "members/" + id
    When method delete
    Then status 200
    And match $.msg == "Member with id "+id+" is deleted successfully"