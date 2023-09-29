*** Settings ***
Library   SeleniumLibrary
*** Variables ***
${url}        https://www.calculatestuff.com/miscellaneous/tip-calculator?fbclid=IwAR2xPmtkHRBMs-dToNWz7YYsu3j4fbu8K7MmdwJR_2J0LMAgi946AJ0hVyM
${browser}    chrome
*** Test Cases ***

Demo Radio
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

    ${timeout}  Get Selenium Timeout  
    Log To Console  wait:${timeout}

    Input Text  //input[@id='bill_amount']  250
    Select Checkbox  //input[@id='split_bill']
    Input Text  //input[@id='split_between']  3
    Click Button  //input[@id='calculate-button']


    Wait Until Element Is Visible  //div[@id='results']//div[3]//div[2]  20s
    ${TipAmount}  Get Text  //div[@id='results']//div[3]//div[2]
    Log To Console  ${TipAmount} 
    ${TotalPrice}  Get Text  //div[@id='results']//div[4]//div[2]
    Log To Console  ${TotalPrice}

    Close Browser

    