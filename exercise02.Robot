*** Settings ***
Library   SeleniumLibrary
*** Variables ***
${url}        http://www.saucedemo.com/
${browser}    chrome
@{list}  standard_user  secret_sauce
&{ll}  usr=standard_user  psw=secret_sauce
*** Test Cases ***

Demo Login
    Open Browser  ${url}   ${browser}
    Maximize Browser Window
    Input Text    id:user-name    ${ll}[usr]
    Input Password    id:password    ${ll}[psw]
    Click Button    class:submit-button
    Sleep  2s
    ${textData}  Get Text  class:title
    Log To Console  ${textData}
    sleep  3s
    Close Browser



