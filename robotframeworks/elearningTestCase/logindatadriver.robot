*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String


*** Variables ***
${URL}              https://demo.itlearn360.com/
${BROWSER}          FireFox
${CSV_FILE_PATH}    ./elearningTestCase/resources/data.csv

*** Test Cases ***
Load Data From CSV And Use On Website
    [Documentation]    This test case reads data from a CSV file and uses it to log in to the website.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    @{data}    Read CSV File    ${CSV_FILE_PATH}
    FOR    ${row}    IN    @{data}
        ${username}    Set Variable    ${row}[0]
        ${password}    Set Variable    ${row}[1]

        Log    Using username: ${username} and password: ${password}

        # Assuming there are input fields for username and password on the page
        Click Element   xpath://*[@id="loginlabel"]
         Input Text  id:user_login  ${username}
         Input Text  name:pwd    ${password}
         Click Element   name:wp-submit

        # Here you could add verification steps, e.g., checking for login success

        # Navigate back to the login page for the next iteration
        Go Back

    END
    Close Browser

*** Keywords ***
Read CSV File
    [Arguments]    ${file_path}
    @{data}    Create List
    ${file_content}    Get File    ${file_path}
    ${lines}    Split String    ${file_content}    \n
    FOR    ${line}    IN    @{lines}
        ${row}    Split String    ${line}    ,
        Append To List    @{data}    ${row}
        Set Test Variable    @{data}
    END
    RETURN    @{data}