*** Settings ***
Library   SeleniumLibrary
Library    String
*** Variables ***
${url}        https://www.currency.me.uk/convert/usd/thb
${browser}    headlesschrome
*** Test Cases ***

Demo Currency
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    Click Link  //a[contains(text(),'Euro')]
    sleep  2s
    Input Text  //input[@id='amount']   123
    ${answer}  Get Element Attribute  //input[@id='answer']  value
    Log To Console  ${answer}
    sleep  2s
    ${usdEx}  Get Text  //div[@id='tofrom2a']/span[@class='mini ccyrate']
    ${eurEx}  Get Text  //div[@id='tofrom4a']/span[@class='mini ccyrate']
    Log To Console  ${usdEx} 
    Log To Console  ${eurEx} 
    ${eurExNum}    Get Regexp Matches    ${eurEx}    \\d.\\d+
    ${usdExNum}    Get Regexp Matches    ${usdEx}    \\d.\\d+
    Log To Console  ${eurExNum}
    Log To Console  ${usdExNum}
    sleep  2s
    Should Contain   ${answer}   116
    sleep  2s
    Close Browser