*** Settings ***
Documentation           Test to check RF environment w/ SeleniumLibrary & ChromeDriver.
Library         SeleniumLibrary   15.0   5.0
Test Setup      Open Shoppinglist
Test Teardown   Close Browser

*** Variables ***
${Browser}      Chrome
${Sleep}	5
${URL}          http://localhost:8080

*** Test Cases ***
View Shoppinglist Test Case
        Page Should Contain     Shopping List Example

Check Contents Test Case
        Page Should Contain     Milk
        Page Should Contain     Eggs
        Page Should Contain     Bread

Remove Item Test Case
        Click Button    xpath:(.//button[contains(., '×')])[last()]
        Page Should Not Contain     Bread
        
*** Keywords ***
Open Shoppinglist
        Open Browser    ${URL}       ${BROWSER}
        Sleep   ${Sleep}