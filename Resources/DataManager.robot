*** Settings ***
Library  ../CustomeLibs/csv_utils.py

*** Keywords ***
Get Login Data
    [Arguments]  ${FilePath}
    ${Data} =  read_csv  ${FilePath}
    [Return]  ${Data}
