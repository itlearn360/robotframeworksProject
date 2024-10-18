*** Settings ***
Documentation  TestDemonstration
Library  SeleniumLibrary
Test Setup              Open the url
Test Teardown           Close Browser
Resource        resource.robot


*** Variables ***

${time}     10 seconds
${user}     Demo12
${pass}     Test123456$


*** Test Cases ***
ELearningWebsite
    ItLearn360 Login Code       ${user}     ${pass}



*** Keywords ***

ItLearn360 Login Code
    [arguments]         ${user}         ${pass}
         Maximize browser Window
         set selenium implicit wait    ${time}
         Click Element   xpath://*[@id="loginlabel"]
         Input Text  id:user_login  ${user}
         Input Text  name:pwd    ${pass}
         Click Element   name:wp-submit
         Element Text Should be      xpath://*[@id="login-list"]/li[1]/a         Dashboar
