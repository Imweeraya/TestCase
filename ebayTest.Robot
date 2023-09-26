*** Settings ***
Library   SeleniumLibrary
*** Variables ***
${url}        https://www.ebay.com/
${browser}    chrome
*** Test Cases ***

Demo ebay
    Open Browser  ${url}   ${browser} 
    Maximize Browser Window
    Input Text    //input[@id='gh-ac']   Macbook pro m2 used 
    Click Button  //input[@id='gh-btn']
    Sleep  2s
    ${result}  get text  //body[1]/div[5]/div[4]/div[1]/div[1]/div[2]/div[1]/div[1]/h1[1]/span[1]
    Should Not Be Equal As Strings    ${result}    217
    Sleep  2s
    Close Browser


    
