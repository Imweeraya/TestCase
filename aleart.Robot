*** Settings ***
Library   SeleniumLibrary
*** Variables ***
${url}        http://the-internet.herokuapp.com/javascript_alerts?fbclid=IwAR0isodzNNdQGmWV_smhr6lYLN420cf7DU4HuOItXmWCxbqeGNVVMXZssFI
${browser}    chrome
*** Test Cases ***

Demo Form
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

    Click Button  //button[contains(text(),'Click for JS Alert')]
    ${massage}  Handle Alert  ACCEPT 
    Log To Console  ${massage}
    Sleep  2s

    Click Button  //button[contains(text(),'Click for JS Confirm')]
    ${massage2}  Handle Alert  ACCEPT 
    Log To Console  ${massage2}
    Sleep  2s

    Click Button  //button[contains(text(),'Click for JS Prompt')]
    Input Text Into Alert  'aaaa'
    ${massage3}  Get Text  //p[@id='result']
    Log To Console  ${massage3}
    Sleep  2s

    Close Browser
