*** Settings ***

Documentation   DropDownAlert
Library  SeleniumLibrary

*** Variables ***
${url}          https://training.qaonlinetraining.com/testPage.php
${browser}          Chrome

*** Test Cases ***
RadioButton and CheckBox
    Perform Click on Button

Dropdown elements
    Select Value
Alert Test
    Alert click

*** Keywords ***
Perform click on button
        Open browser        ${url}       ${browser}
        Maximize browser window
        Click Element       xpath:/html/body/form/input[5]
        Sleep       10
        Click Element       xpath:/html/body/form/input[9]

Select Value
        Select From List By Label       country         Ethiopia
        Sleep       10
        Click Element       name:submit

Alert Click
        Click Element           id:alert
        handle alert        accept
        Sleep       10
        Click Element           id:confirm
        handle alert        dismiss
