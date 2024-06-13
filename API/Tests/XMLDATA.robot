*** Settings ***
Library     Collections
Library     String
Library     JSONLibrary
Library     RequestsLibrary
Library     XML

*** Variables ***
${BaseUrl}    https://reqres.in
${XML_FILE}   C:/Users/admin/PycharmProjects/APIAutomation/API/Tests/data.xml

*** Test Cases ***
LoadDataMethod
    [Tags]   Demo3

    Log To Console    ${XML_FILE}
    ${XML}=           Parse XML    ${XML_FILE}
    ${Page}=          Get Element   ${XML}   Class/employee id
    ${PerPage}=       Get Element   ${XML}   Class/lastname
    ${Total}=         Get Element   ${XML}   Class/nickname
    ${TotalPages}=    Get Element   ${XML}   Class/salary
    #${DataList}=      Get Element   ${XML}   root/data

    Log To Console    Page: ${Page}
    Log To Console    Per Page: ${PerPage}
    Log To Console    Total: ${Total}
    Log To Console    Total Pages: ${TotalPages}

   # :FOR    ${data}    IN    @{DataList}
    \    ${ID}=          Get Element    ${data}    id
    \    ${Name}=        Get Element    ${data}    name
    \    ${Year}=        Get Element    ${data}    year
    \    ${Color}=       Get Element    ${data}    color
    \    ${Pantone}=     Get Element    ${data}    pantone_value
    \    Log To Console  ID: ${ID}, Name: ${Name}, Year: ${Year}, Color: ${Color}, Pantone: ${Pantone}

    ${Support}=        Get Element    ${XML}    root/support
    ${SupportUrl}=     Get Element    ${Support}    url
    ${SupportText}=    Get Element    ${Support}    text

    Log To Console    Support URL: ${SupportUrl}
    Log To Console    Support Text: ${SupportText}








