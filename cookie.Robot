*** Settings ***
Library   SeleniumLibrary
*** Variables ***
${url}        https://www.osano.com/cookieconsent/demos/?fbclid=IwAR2TWC-gqvLgQ5de80OEYfutl9WM9dGavQMThwf-955mW-pTDUHXVBxheNg
${browser}    chrome
${cookie}  //button[@class=' osano-cm-denyAll osano-cm-buttons__button osano-cm-button osano-cm-button--type_denyAll ']
*** Test Cases ***

Demo Form
    Open Browser  ${url}  ${browser}

    
    Maximize Browser Window

    ${flag}  Run Keyword And Return Status
    ...  Wait Until Keyword Succeeds  10s  2s  Page Should Contain Element  ${cookie}
    Run Keyword If  ${flag} == ${True}  Click Element  ${cookie}

    # IF  ${flag}
    #     Click Element  ${cookie}
    # END
    

    sleep  2s
    Close Browser
