*** Settings ***
Library   SeleniumLibrary
*** Variables ***
${url}        http://the-internet.herokuapp.com/login
${browser}    chrome
*** Test Cases ***

Demo Login
    Open Browser  ${url}   ${browser}
    Maximize Browser Window
    Input Text    id:username    tomsmith
    Input Password    id:password    SuperSecretPassword!
    Click Button    class:radius
    Sleep  2s
    ${text}    Get Text    id:flash
    Log To Console  ${text}
    Click Link    Logout
    sleep  3s
    Close Browser

# TC1: demo
#     Open Browser  https://www.example.com  chrome
#     ...  ${OPTIONS}=add_exoerimental_option("detach", true)
#     Maximize Browser Window
#     ${url}    Get Location
#     ${title}    Get Title
#     Log To Console  ${url} with ${title}
#     sleep  3s
#     Close Browser
