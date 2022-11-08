*** Settings ***
Documentation    Buffetin olisi tarkoitus näyttää hinnaksi 11,30€

Library    Browser
Library    Process
Library    String

*** Variables ***
${URL}    localhost:3000
${npm}    npm    start

*** Test Cases ***
Localhost Test
    Start Process    npm start    shell=True
    Sleep    5 seconds
    New Browser    chromium    headless=false
    New Page    ${URL}
    ${hinta}=    Get Text    //*[@id="root"]/div/div/table/tbody/tr[2]/td/p[1]/strong
    ${hinta}=    Fetch From Left    ${hinta}    \xa0
    Log    ${hinta}
    Should Be Equal    ${hinta}    Buffet 11,30 €
