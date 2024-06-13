*** Settings ***
Library     Collections
Library     String
Library     JSONLibrary
Library     RequestsLibrary

*** Variables ***
${BaseUrl}     https://reqres.in
${page_path}      $.page
*** Test Cases ***
TestTitle
    [Tags]  demo
    Create Session    session1    ${BaseUrl}    disable_warnings=1
    ${EndPoint}    Set Variable    /api/users?page=2
    ${Response}    GET On Session    session1    ${EndPoint}
    Log To Console    ${Response.headers}
    Log To Console    ${Response.status_code}
    Log To Console    ${Response.content}
    Log    ${Response.content}

    # Validations
    ${status_code}=    Convert To String    ${Response.status_code}
    Should Be Equal    ${status_code}    200

    ${json_response}=    Convert String To JSON    ${Response.content}
    ${page_value}=    Get Value From JSON    ${json_response}    page   ${page_path}
    ${page_value}=    Convert To String    ${page_value}
    Should Be Equal    ${page_value}       [2]
    #${headerValue}=  Get From Dictionary    ${Response.headers}   content-type
    #Should Be Equal   ${headerValue}  Application/json;  Charset = utf-8

    ${headerValue}=    Get From Dictionary    ${Response.headers}    content-type
    Should Be Equal    ${headerValue.lower()}    application/json; charset=utf-8
*** Test Cases ***

    
