*** Settings ***
Documentation           Test to check RF environment w/ SeleniumLibrary & ChromeDriver.
Library         SeleniumLibrary   15.0   5.0
Test Setup      Open Shoppinglist
Test Teardown   Reset And Close Shoppinglist

*** Variables ***
${Browser}      headlesschrome
${Sleep}	0
${URL}          http://localhost:8080

*** Test Cases ***
View Shoppinglist Test Case
        Skip If Previous Fails Or Skips
        Page Should Contain     Shopping List Example

Check Contents Test Case
        Skip If Previous Fails Or Skips
        Page Should Contain     Milk
        Page Should Contain     Eggs
        Page Should Contain     Bread

Remove Item Test Case
        Skip If Previous Fails Or Skips
        Click Button    xpath:(.//button[contains(., '×')])[last()]
        Page Should Not Contain     Bread

*** Keywords ***
Open Shoppinglist
        TRY
                Open Browser    ${URL}       ${BROWSER}
                Sleep   ${Sleep}
        EXCEPT
                Fatal Error    Unable to open ${URL}.
        END

Skip If Previous Fails Or Skips
        Skip If         '${PREV TEST STATUS}' == 'FAIL'
        Skip If         '${PREV TEST STATUS}' == 'SKIP'

Reset And Close Shoppinglist
        # Before closing the browers, it would be good to reset the
        # shopping list contents back to its original contents of
        # Milk, Eggs and Bread by adding Bread. Since adding an item
        # is a part of Assignment 2, it is not done here. You can
        # edit your own version of this script to have the adding done.
        Close Browser