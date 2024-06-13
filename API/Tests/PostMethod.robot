*** Settings ***
Library     Collections
Library     String
Library     JSONLibrary
Library     RequestsLibrary

*** Variables ***
${BaseUrl}     https://reqres.in
${id_path}     $.id

*** Test Cases ***
Post Method
    [Tags]   postMethod
    Create Session    session1    ${BaseUrl}    disable_warnings=1
    ${EndPoint}    Set Variable    /api/users
    ${Body}=    Create Dictionary    name=venkat    job=SWEngineer
    ${Response}=    POST On Session    session1    ${EndPoint}    data=${Body}
    Log To Console    ${Response.headers}
    Log To Console    ${Response.status_code}
    Log To Console    ${Response.content}
    Log    ${Response.content}

    # Validations
    ${status_code}=    Convert To String    ${Response.status_code}
    Should Be Equal    ${status_code}    201

    ${json_response}=    Convert String To JSON    ${Response.content}
    ${id_value}=    Get Value From JSON    ${json_response}    ${id_path}
    Log To Console    ${id_value}
    Should Not Be Empty    ${id_value}
