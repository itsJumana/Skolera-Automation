*** Settings ***
# robot --outputdir Results Tests/StudentBulkActionSuite.robot
Resource    ../Resources/PO/StudentsList.robot
Resource    ../Resources/Common.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***

*** Test Cases ***
Deactivate Students
    [Documentation]    Test case to deactivate multiple students
    [Tags]             Bulk Action
    Login and Navigate to Student List
    Deactivate Multiple Students    3
    Sleep   3s
