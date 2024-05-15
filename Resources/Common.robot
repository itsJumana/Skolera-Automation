*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}  chrome
${URL}    https://staging.skoleralms.com/

*** Keywords ***
Begin Web Test
    Open Browser   ${URL}    ${BROWSER}
    Maximize Browser Window

End Web Test
    Close Browser

