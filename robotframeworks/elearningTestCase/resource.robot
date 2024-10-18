*** Settings ***
Documentation           Test case to execute the login process
Library             SeleniumLibrary


*** Variables ***
${url}      https://demo.itlearn360.com/
${browser}      FireFox

*** Keywords ***

Open the url
        Open Browser        ${url}      ${browser}
        Maximize Browser Window