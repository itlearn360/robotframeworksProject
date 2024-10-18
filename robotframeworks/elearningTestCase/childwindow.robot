*** Settings ***
Documentation  TestDemonstration
Library  SeleniumLibrary
Test Setup              Open the url
Resource        resource.robot

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${time}     10 seconds
${user}     Demo12
${pass}     Test123456$
*** Test Cases ***
Login to website
         Click Element   xpath://*[@id="loginlabel"]
         Input Text  id:user_login  ${user}
         Input Text  name:pwd    ${pass}
         Click Element   name:wp-submit
Handle Child Windows and Tabs
# Assuming there is a link on the main page that opens in a new tab/window
        Click Link    xpath://*[@id="login-list"]/li[1]/a  # Replace with actual link text or locator that opens a new window/tab

    # Get the list of all open windows
    ${all_windows}    Get Window Handles
    Log    All windows: ${all_windows}

    # Switch to the new window/tab (assuming it is the second one in the list)
    Switch Window    ${all_windows[1]}
    Log    Switched to new window/tab

    # Perform actions in the new window/tab
    ${new_page_text}    Get Text    xpath=//*[@id="learn-press-user-info"]/div/h4    # Adjust locator to match an element on the new page
    Log    The text in the new tab is: ${new_page_text}

    # Switch back to the original window
    Switch Window    ${all_windows[0]}
    Log    Switched back to the original window

    # Perform any further actions on the original window if necessary

    Close Browser