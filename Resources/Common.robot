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

Refresh Browser
    [Documentation]    Refresh the browser to reset the state for the next test
    Reload Page
