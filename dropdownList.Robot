*** Settings ***
Library   SeleniumLibrary
*** Variables ***
${url}        https://rahulshettyacademy.com/AutomationPractice/?fbclid=IwAR3PQDovaQaGZpL1yV2lcDl1AlkQMbIlp2SETeh9zbGezN_YwNVdcNKg_Oc
${browser}    chrome
*** Test Cases ***

Demo Dropdown
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

    Page Should Contain Radio Button    //input[@value='radio2' and @name='radioButton']
    Select Radio Button    radioButton    radio2

    Page Should Contain List  id:dropdown-class-example
    Select From List By Value  id:dropdown-class-example  option2
    
    ${list}  Get Selected List Value   id:dropdown-class-example
    Should Contain  ${list}  option2
    
    sleep  3s
    Close Browser
    