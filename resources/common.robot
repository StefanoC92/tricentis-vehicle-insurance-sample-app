*** Settings ***
Documentation       Resource file containing keywords common to all Test Suites

Library             String
Library             Collections
Library             SeleniumLibrary


*** Variables ***
${BROWSER}              headlesschrome
# ${OPTIONS}              add_argument("--start-maximized")
${HOME_PAGE_URL}        https://sampleapp.tricentis.com/101/
${HOME_PAGE_TITLE}      Tricentis Vehicle Insurance

*** Keywords ***
Create Chrome Options
    [Documentation]    Keyword allowing to set options when opening chrome browser and return a chrome object
    
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    Call Method    ${options}    add_argument            --start-maximized

    Set Suite Variable    ${OPTIONS}    ${options}

Navigate to Home Page
    [Documentation]    Keyword to open the chrome browser and navigate to home page
    Open Browser       url=${HOME_PAGE_URL}   browser=${BROWSER}    options=${OPTIONS}
    Title Should Be    ${HOME_PAGE_TITLE}  

    

