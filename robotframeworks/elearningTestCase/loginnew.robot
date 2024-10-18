*** Settings ***
Documentation  TestDemonstration
Library  SeleniumLibrary
Test Setup              Open the url
Test Teardown           Close Browser
Resource        resource.robot
Test Template   ItLearn360 Login Code


*** Variables ***

${time}     10 seconds
${user}     Demo12
${pass}     Test123456$


*** Test Cases ***
           Name       username     password
Invalid useranme        Demo1234    Test123456$
Invalid password        Dem012      Test12344454
Invalid characters      abc##       Test123456$



*** Keywords ***

ItLearn360 Login Code
    [arguments]         ${username}         ${password}
         Maximize browser Window
         set selenium implicit wait    ${time}
         Click Element   xpath://*[@id="loginlabel"]
         Input Text  id:user_login  ${username}
         Input Text  name:pwd    ${password}
         Click Element   name:wp-submit
