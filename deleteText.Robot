*** Settings ***
Library   SeleniumLibrary
*** Variables ***
${url}        https://th.indeed.com/
${browser}    chrome
*** Test Cases ***

Demo Dropdown
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

    Input Text  //input[@id='text-input-what']  Software Tester
    Press Keys  //input[@id='text-input-what']  CTRL+A+DELETE
    Input Text  //input[@id='text-input-what']  Robot Framework
    Input Text  //input[@id='text-input-where']  Bangkok
    Click Button  //button[@class='yosegi-InlineWhatWhere-primaryButton']
    
    Wait Until Element Is Visible  //div[@class='jobsearch-JobCountAndSortPane-jobCount css-1af0d6o eu4oa1w0']  2s
    ${result}  Get Text  //div[@class='jobsearch-JobCountAndSortPane-jobCount css-1af0d6o eu4oa1w0']
    Log To Console  ${result}

    Close Browser
