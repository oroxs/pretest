*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Variables ***
${HOST}    https://jsonplaceholder.typicode.com
${atitle}  recommendation
${abody}    motorcycle
${aid}       12

*** Test Cases ***
API Get
    create session    mysession     ${HOST}
    ${response}=    get request     mysession   /posts
    #log to console      ${response.status_code}
    #log to console      ${response.content}
    #log to console      ${response.headers}

    Should Be Equal As Strings    ${response.status_code}    200
    ${data}=    Evaluate    json.loads($response.content)    json

    Should Be Equal As Integers     ${data[0]['userId']}    ${data[0]['userId']}
    Should Be Equal As Integers     ${data[0]['id']}    ${data[0]['id']}
    Should Be Equal As Strings     ${data[0]['title']}    ${data[0]['title']}
    Should Be Equal As Strings     ${data[0]['body']}    ${data[0]['body']}

API Post
    create session    mysession     ${HOST}
    ${body}=   create dictionary   title=${atitle}   body=${abody}   userId=${aid}
    ${header}=  create dictionary   Content-Type=application/json
    ${response}=    post request   mysession   /posts   data=${body}  headers=${header}

    log to console      ${response.status_code}
    log to console      ${response.content}

    #validation
    ${res_body}=      convert to string   ${response.content}
    should contain  ${res_body}     ${atitle}
    should contain  ${res_body}     ${abody}
    should contain  ${res_body}     ${aid}
