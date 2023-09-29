*** Settings ***
Library   SeleniumLibrary
*** Variables ***
${url}        https://www.jqueryscript.net/demo/Price-Range-Slider-jQuery-UI/?fbclid=IwAR3-w_B6ikrcTH5mYTKiEIHaYZsDZSpiK9AkLG0gdmcMc8AuJQi_UmsKIHo
${browser}    chrome
${slider1}  //div[@id='slider-range']/span[1]
${slider2}  //div[@id='slider-range']/span[2]
*** Test Cases ***

Demo Radio
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    
    ${x1}  Get Horizontal Position  ${slider1}
    ${y1}  Get Vertical Position  ${slider1}

    ${x2}  Get Horizontal Position  ${slider2}
    ${y2}  Get Vertical Position  ${slider2}

     ${x1}  Evaluate  ${x1}+100
     Drag And Drop By Offset  ${slider1}   ${x1}  ${y1}
     ${value1}  Get Element Attribute  id:min_price  value
     Log To Console  ${value1}
     
     ${x2}  Evaluate  ${x2}-(100+${x2})
     Drag And Drop By Offset  ${slider2}  ${x2}  ${y2}
     ${value2}  Get Element Attribute  id:max_price  value
     Log To Console  ${value2}

     sleep  2s

     Close Browser