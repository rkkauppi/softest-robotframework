*** Settings ***
Documentation           View Shoppinglist
Library         SeleniumLibrary   15.0   5.0

*** Variables ***
${Browser}      Chrome
${URL}          http://localhost:8080
${Sleep}	3

*** Test Cases ***
View Shoppinglist Test Case
        Open Browser    ${URL}       ${BROWSER}
	Sleep	${SLEEP}
        Page Should Contain     Shopping List Example

Check Contents Test Case
        Page Should Contain     Milk
        Page Should Contain     Eggs
        Page Should Contain     Bread

Remove Item Test Case
        Click Button   	xpath:(.//button[contains(., 'x')])[last()]
        Sleep	${SLEEP}
        Page Should Not Contain   	Bread
        Close Browser

*** Keywords ***