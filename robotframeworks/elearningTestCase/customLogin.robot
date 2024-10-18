*** Settings ***
Library           SeleniumLibrary
Library           ./ITLearn360Library.py

*** Variables ***
${USERNAME}       Demo12
${PASSWORD}       Test123456$

*** Test Cases ***
Test Login Functionality
    [Documentation]    Test the login functionality on ITLearn360 with valid credentials.
    Open Home Page
    Login    ${USERNAME}    ${PASSWORD}
    Verify Logged In
