*** Settings ***
Library   SeleniumLibrary
*** Variables ***
${url}        https://jqueryui.com/autocomplete/?fbclid=IwAR1DyqS0756D4tSfkXEetqP1og3BGh9WHnyHha9i5DOeL4SfdkCv7ZUtWow
${browser}    chrome

*** Test Cases ***

Demo Login
    Open Browser  ${url}   ${browser}
    Maximize Browser Window

    Select Frame  //iframe[@class='demo-frame']
    Input Text  //input[@id='tags']  a
    
    Wait Until Element Is Visible  //li[@class='ui-menu-item']
    @{List}  Get webelements  //li[@class='ui-menu-item']
    

    FOR  ${element}  IN  @{List}
        ${text}  Get Text  ${element}
        ${found}  set variable if  '${text}' == 'JavaScript'  ${True}  ${False} 
        Log To Console  ${text}
        Exit For Loop If  ${found}
    END

    sleep  3s
    Close Browser
    