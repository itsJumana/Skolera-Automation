*** Settings ***
Resource    ../Resources/PO/LoginPage.robot
Resource    ../Resources/Common.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***
&{CREDENTIALS}    username=skolera    password=asdasd123A!    invalid_username=wrongUsername    invalid_password=wrongpassword123!
${CREDENTIALS_ERROR_TEXT}    Invalid login credentials. Please try again.
${EMPTY_USERNAME_ERROR_TEXT}    Username is required.
${EMPTY_PASSWORD_ERROR_TEXT}    Password is required.
${SUCCESSFUL_LOGIN}    Sync
${EMPTY_STRING}

*** Test Cases ***
Valid Login
    [Documentation]    Test case to verify successful login with valid username and password
    [Tags]    Login
    Log In To Skolera    ${CREDENTIALS['username']}    ${CREDENTIALS['password']}    ${SUCCESSFUL_LOGIN}

Invalid Password Login
    [Documentation]    Test case to verify error message for invalid password login
    [Tags]    Login
    Log In To Skolera    ${CREDENTIALS['username']}    ${CREDENTIALS['invalid_password']}    ${CREDENTIALS_ERROR_TEXT}

Invalid Username Login
    [Documentation]    Test case to verify error message for invalid username login
    [Tags]    Login
    Log In To Skolera    ${CREDENTIALS['invalid_username']}    ${CREDENTIALS['password']}    ${CREDENTIALS_ERROR_TEXT}

Invalid Username and Password Login
    [Documentation]    Test case to verify error message for invalid username and password login
    [Tags]    Login
    Log In To Skolera    ${CREDENTIALS['invalid_username']}    ${CREDENTIALS['invalid_password']}    ${CREDENTIALS_ERROR_TEXT}

Empty Password Field Login
    [Documentation]    Test case to verify error message for empty password field
    [Tags]    Login
    Log In To Skolera    ${CREDENTIALS['username']}    ${EMPTY_STRING}    ${EMPTY_PASSWORD_ERROR_TEXT}

Empty Username Field Login
    [Documentation]    Test case to verify error message for empty username field
    [Tags]    Login
    Log In To Skolera    ${EMPTY_STRING}    ${CREDENTIALS['password']}    ${EMPTY_USERNAME_ERROR_TEXT}
