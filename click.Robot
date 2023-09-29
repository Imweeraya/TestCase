*** Settings ***
Library   SeleniumLibrary
*** Variables ***
${url}        https://swisnl.github.io/jQuery-contextMenu/demo.html?fbclid=IwAR3XPhrHxhHv3ojc7RGT2eHkrGpxVPiCD9rsQjZkRdTvmPC8BFlF2jFWGeU
${browser}    chrome
*** Test Cases ***

Demo Form
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

    Open Context Menu  //span[@class='context-menu-one btn btn-neutral']
    Click Element  //ul[@class='context-menu-list context-menu-root']/li[3]
    
    ${massage2}  Handle Alert  ACCEPT 
    Log To Console  ${massage2}
    Sleep  2s

    Close Browser