*** Settings ***
Library    SeleniumLibrary
Resource    ./LoginPage.robot
Resource    ../Common.robot

*** Variables ***
${Side_Menu_Xpath}      /html/body/app-root/div[1]/main-component/div/div/div/div/app-header/div/div[1]/div[1]/div/span
${Focus_Insights_xpath}     //*[@id="main-sidebar"]/div/div[3]/div[5]/span
${Users_drop_down_xpath}    //*[@id="main-sidebar"]/div/div[3]/div[5]/div[2]/div[1]/span
${Students_Option_xpath}    //*[@id="main-sidebar"]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/a/div/span
${Students_List_Header_Xpath}    //*[@id="table-container"]/div/div[1]/div[2]/div/table/thead
${Check_box_common_xpath}   //*[@id="table-container"]/div/div[1]/div[2]/div/table/tbody
${Action_Menu_Xpath}    //*[@id="table-container"]/div/div[1]/div[2]/div/table/thead/tr/th[10]/span
${Deactivate_Option_Xpath}      //*[@id="table-container"]/div/div[1]/div[2]/div/table/thead/tr/th[10]/span/div/div[4]
${Post_Common_Xpath}    td[1]/skolera-multi-checkbox
${Deactivate_Selected_Button_Xpath}  //*[@id="mat-dialog-0"]/skolera-confirmation/div/div/div/div[2]/div/button[2]
${Deactivation_Message_Text}    Student Account Has Been Deactivated Successfully
${USERNAME}    skolera
${PASSWORD}    asdasd123A!

*** Keywords ***
Login and Navigate to Student List
    Log In To Skolera    ${USERNAME}    ${PASSWORD}    Sync
    Click Element   xpath:${Focus_Insights_xpath}
    Wait Until Element Is Visible   xpath:${Users_drop_down_xpath}  timeout=30s
    Click Element   xpath:${Users_drop_down_xpath}
    Wait Until Element Is Visible   xpath:${Students_Option_xpath}  timeout=30s
    Click Element   xpath:${Students_Option_xpath}

Deactivate Multiple Students
    [Arguments]  ${StudentsCount}
    Wait Until Element Is Visible    xpath:${Students_List_Header_Xpath}  timeout=30s

    ${TotalStudents}=    Evaluate    ${StudentsCount} + 1   # Allow us to execute Python code within your Robot test cases.
    FOR    ${studentIndex}    IN RANGE    1    ${TotalStudents}
        ${studentCheckboxXPath}=    Set Variable    ${Check_box_common_xpath}/tr[${studentIndex}]/${Post_Common_Xpath}
        Click Element    xpath:${studentCheckboxXPath}
    END

    Click Element   xpath:${Action_Menu_Xpath}
    Wait Until Element Is Visible   xpath:${Deactivate_Option_Xpath}  timeout=30s
    Click Element   xpath:${Deactivate_Option_Xpath}

    Wait Until Element Is Visible   xpath:${Deactivate_Selected_Button_Xpath}  timeout=30s
    Click Element   xpath:${Deactivate_Selected_Button_Xpath}

    Wait Until Page Contains    ${Deactivation_Message_Text}  timeout=30s
