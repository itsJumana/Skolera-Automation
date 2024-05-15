*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_BUTTON_CLASS}    login-btn
${USERNAME_FIELD_CLASS}    login-input
${PASSWORD_FIELD_XPATH}    /html/body/app-root/div[1]/login-components/div/div/div[1]/div/div/form/div[2]/div/input
${REMEMBER_ME_CHECKBOX_ID}    remember_me_checkbox_id
${LOGIN_BUTTON_ID}    login_button_id

*** Keywords ***
Input Username
    [Arguments]    ${username}
    Wait Until Element Is Visible    class:${USERNAME_FIELD_CLASS}    timeout=15
    Input Text    class:${USERNAME_FIELD_CLASS}    ${username}

Input Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    xpath:${PASSWORD_FIELD_XPATH}    timeout=15
    Input Text    xpath:${PASSWORD_FIELD_XPATH}    ${password}

Click Login Button
    Click Button    class:${LOGIN_BUTTON_CLASS}

Verify Login
    [Arguments]  ${Locator}
    Wait Until Page Contains   ${locator}    timeout=15

Log In To Skolera
    [Arguments]    ${username}    ${password}   ${locator}
    Input Username    ${username}
    Input Password    ${password}
    Click Login Button
    Verify Login    ${locator}
