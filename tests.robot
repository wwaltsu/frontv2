*** Settings ***
Documentation    Buffetin olisi tarkoitus näyttää hinnaksi 11,30€

Library    Browser
Library    Process
Library    String

Test Teardown    Close Test

*** Variables ***
${URL}    localhost:3000
${npm}    npm    start



*** Test Cases ***
Localhost Test
    Start Process    npm start    cwd=${CURDIR}${/}..${/}backv2${/}    shell=True    stdout=stdout.txt
    Start Process    npm start    shell=True
    #Sleep    10 seconds
    #New Browser    chromium    headless=false
    #New Page       ${URL}

    Sleep    30 seconds
    #Get Element    //html/body
    
 #   ${hinta}=    Get Text    //*[@id="root"]/div/div/table/tbody/tr[2]/td/p[1]/strong
 #   ${hinta}=    Fetch From Left    ${hinta}    \xa0
 #       ${hinta}=    Get Text    //*[@id="root"]/div/div/table/tbody/tr[2]/td/p[1]/strong

 #   Log    ${hinta}
 #   Should Be Equal    ${hinta}    Buffet 11,30 €
    Terminate All Processes    kill=True

*** Keywords ***
Close Test
    Terminate All Processes