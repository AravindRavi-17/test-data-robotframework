*** Settings ***
Resource    src/keywords/test_data_keywords.robot

*** Test Cases ***
Reading excel file
    Open Excel File    src/testdata/workbook.xlsx   Sheet1
    Write Values in the Excel       A     396
    Save & Close Excel