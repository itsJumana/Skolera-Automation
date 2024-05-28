*** Settings ***
Resource    ../Resources/PO/LoginPage.robot
Resource    ../Resources/Common.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test
Test Template    Log In With Credentials

*** Variables ***
${USERNAME}    skolera
${PASSWORD}    asdasd123A!
${INVALID_USERNAME}    wrongUsername
${INVALID_PASSWORD}    wrongpassword123!
${CREDENTIALS_ERROR_TEXT}    Invalid login credentials. Please try again.
${EMPTY_USERNAME_ERROR_TEXT}    Username is required.
${EMPTY_PASSWORD_ERROR_TEXT}    Password is required.
${SUCCESSFUL_LOGIN}    Sync
${EMPTY_STRING}

*** Test Cases ***
Valid Login
    [Tags]    Login
    ${USERNAME}    ${PASSWORD}    ${SUCCESSFUL_LOGIN}

Invalid Password Login
    [Tags]    Login
    ${USERNAME}    ${INVALID_PASSWORD}    ${CREDENTIALS_ERROR_TEXT}

Invalid Username Login
    [Tags]    Login
    ${INVALID_USERNAME}    ${PASSWORD}    ${CREDENTIALS_ERROR_TEXT}

Invalid Username and Password Login
    [Tags]    Login
    ${INVALID_USERNAME}    ${INVALID_PASSWORD}    ${CREDENTIALS_ERROR_TEXT}

Empty Password Field Login
    [Tags]    Login
    ${USERNAME}    ${EMPTY_STRING}    ${EMPTY_PASSWORD_ERROR_TEXT}

Empty Username Field Login
    [Tags]    Login
    ${EMPTY_STRING}    ${PASSWORD}    ${EMPTY_USERNAME_ERROR_TEXT}

*** Keywords ***
Log In With Credentials
    [Arguments]    ${username}    ${password}    ${expected_result}
    Log In To Skolera    ${username}    ${password}    ${expected_result}
