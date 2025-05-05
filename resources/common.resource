*** Settings ***
Documentation       Resource file containing keywords/variables common to all Test Suites

Library             String
Library             Collections
Library             SeleniumLibrary


*** Variables ***
${BROWSER}              headlesschrome

*** Keywords ***
Create Chrome Options
    [Documentation]    Keyword allowing to set options when opening chrome browser and return a chrome object
    
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    Call Method    ${options}    add_argument            --start-maximized

    Set Suite Variable    ${OPTIONS}    ${options}



    

