*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Test Cases ***
Get Single User
    [Tags]    api    get
    Given I create a session for reqres API
    When I send GET request to get user with id 2
    Then the response status should be 200
    And the response should contain user data

Create New User
    [Tags]    api    post
    Given I create a session for reqres API
    When I send POST request to create user with name "Sirna Mas" and job "Tester"
    Then the response status should be 201
    And the response should contain created user data

*** Keywords ***
I create a session for reqres API
    Create Session    reqres    https://reqres.in

I send GET request to get user with id ${user_id}
    ${response}=    GET On Session    reqres    /api/users/${user_id}
    Set Test Variable    ${response}

I send POST request to create user with name "${name}" and job "${job}"
    ${data}=    Create Dictionary    name=${name}    job=${job}
    ${response}=    POST On Session    reqres    /api/users    json=${data}
    Set Test Variable    ${response}

The response status should be ${expected_status}
    Should Be Equal As Strings    ${response.status_code}    ${expected_status}

The response should contain user data
    ${json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json}    data
    ${user}=    Get From Dictionary    ${json}    data
    Dictionary Should Contain Key    ${user}    id
    Dictionary Should Contain Key    ${user}    email

The response should contain created user data
    ${json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json}    name
    Dictionary Should Contain Key    ${json}    job
    Dictionary Should Contain Key    ${json}    id
    Dictionary Should Contain Key    ${json}    createdAt