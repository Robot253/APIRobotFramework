*** Settings ***
Library     Collections
Library     String
Library     JSONLibrary
Library     RequestsLibrary

*** Variables ***
${BaseUrl}     https://jsonplaceholder.typicode.com
${id_path}     $.id

*** Test Cases ***
Post Method
    [Tags]   DeleteMethod
    Create Session    session1    ${BaseUrl}    disable_warnings=1
    ${EndPoint}    Set Variable    /posts/1
    # ${Body}=    Create Dictionary    name=Virat    job=cricketer
    ${Response}=    Delete On Session    session1    ${EndPoint}
    Log To Console    ${Response.headers}
    Log To Console    ${Response.status_code}
    Log To Console    ${Response.content}
    Log    ${Response.content}

    # Validations
    ${status_code}=    Convert To String    ${Response.status_code}
    Should Be Equal    ${status_code}    200

   # ${json_response}=    Convert String To JSON    ${Response.content}
   # ${id_value}=    Get Value From JSON    ${json_response}    ${id_path}
    #Log To Console    ${id_value}
   # Should Not Be Empty    ${id_value}
