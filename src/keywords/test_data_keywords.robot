*** Settings ***
Library    RPA.Tables
Library    RPA.Excel.Files

*** Variables ***
@{values}     AAA    BBB    CCC    DDD    EEE    FFF    GGG    HHH    III
    ...       JJJ    KKK    LLL    AASHA     DEVI

*** Keywords ***
Open Excel File
    [Arguments]    ${path}  ${sheet_name}
    Open Workbook    ${path}
    Set Active Worksheet    ${sheet_name}
    
Write Values in the Excel
    [Arguments]    ${column_name}  ${count}

    ${start_row}=      Set Variable    2
    
    FOR  ${value}  IN   @{values}
        ${end_row}  Evaluate      ${count} + ${start_row}

        FOR  ${index}  IN RANGE  ${start_row}   ${end_row}
            Set Cell Value    ${index}   ${column_name}     ${value}
        END
        ${start_row}  Set Variable    ${index} + 1
    END

Save & Close Excel
    Save Workbook
    Close Workbook
