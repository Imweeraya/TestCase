*** Settings ***
Library   SeleniumLibrary
*** Variables ***
${url}        https://demo.seleniumeasy.com/basic-radiobutton-demo.html?fbclid=IwAR1uEBKkytVhUAw1sHdMV0vgAQfF2svv7N_uzNkE6QDNNQAqpxNr77Q0hhs
${browser}    chrome
*** Test Cases ***

Demo Radio
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

    Page Should Contain Radio Button    //input[@value='Female' and @name='gender']
    Scroll Element Into View    //div[@class='panel-heading']
    Page Should Contain Radio Button    //input[@value='Female' and @name='gender']
    Select Radio Button    gender    Female
    Select Radio Button    ageGroup  15 - 50
    Click Button  //button[contains(text(),'Get values')]
    ${text}  Get Text  //body/div[@id='easycont']/div[1]/div[2]/div[2]/div[2]/p[2]
    Log To Console  ${text}
    Should Contain  ${text}  Female
    Should Contain  ${text}  15 - 50
    
    sleep  3s
    Close Browser
    