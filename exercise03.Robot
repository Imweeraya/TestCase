*** Settings ***
Library   SeleniumLibrary
*** Variables ***
${url}        https://petstore.octoperf.com/actions/Catalog.action
${browser}    chrome
*** Test Cases ***

Demo Login
    Open Browser  ${url}   ${browser}
    Maximize Browser Window
    Sleep  1s
    Click Element  //area[@alt='Dogs']   #x-path
    Sleep  1s
    Click Element  //a[contains(text(),'K9-RT-01')]  #x-path
    Sleep  1s
    Click Element  css:table:nth-child(2) tbody:nth-child(1) tr:nth-child(2) td:nth-child(5) > a.Button    #css selector
    Sleep  1s
    Click Element  //a[contains(text(),'Proceed to Checkout')]  #x-path
    Sleep  1s
    Input Text  name:username  j2ee
    Click Element  //body/div[@id='Content']/div[@id='Catalog']/form[1]/input[1]  #x-path
    Sleep  1s
    Close Browser
    
