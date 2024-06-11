*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/PO/LoginPage.robot
Resource   ../Resources/Common.robot
Resource   ../Resources/DataManager.robot
Test Setup    Begin Web Test
Test Teardown    End Web Test

*** Variables ***
${CSV_FILE}    /home/jumana/PycharmProjects/Skolera-Automation/Data/login_data.csv

*** Test Cases ***
Login Tests From CSV
    [Documentation]    Test cases to verify login functionality using data from a CSV file
    ${login_data}    Get Login Data    ${CSV_FILE}
    FOR    ${row}    IN    @{login_data}
        Log    Testing with username=${row['username']} and password=${row['password']}
        Log In To Skolera    ${row['username']}    ${row['password']}    ${row['expected_result']}
        sleep   2
        Refresh Browser
    END
