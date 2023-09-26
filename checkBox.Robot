*** Settings ***
Library   SeleniumLibrary
*** Variables ***
${url}        https://demo.nopcommerce.com/register?fbclid=IwAR3NhRI9WS_XAzogH-sTAasMIlv8CWVzBet1mCmX4bPB48I75swaRmYQjIo
${browser}    chrome
*** Test Cases ***

Demo Form
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    Page Should Contain Radio Button    //input[@value='F' and @name='Gender']
    Select Radio Button    Gender    F
    Input Text    id:FirstName    We
    Input Password    id:LastName    Ko

    Page Should Contain List  name:DateOfBirthDay
    Select From List By Value  name:DateOfBirthDay  19
    Page Should Contain List  name:DateOfBirthMonth
    Select From List By Value  name:DateOfBirthMonth  8
    Page Should Contain List  name:DateOfBirthYear
    Select From List By Value  name:DateOfBirthYear  2000

    Input Text    id:Email    1888611@gmail.com

    Input Text    id:Company    I am beautiful
    
    Checkbox Should Be Selected  id:Newsletter 

    Input Text    id:Password    hhhhhh1234
    Input Text    id:ConfirmPassword    hhhhhh1234

    Click Button  id:register-button

    ${registersuccess}  Get Text  class:result
    Log To Console  ${registersuccess}

    sleep  2s
    Close Browser
