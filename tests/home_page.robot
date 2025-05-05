*** Settings ***
Documentation    Test Suite for testing the Home Page

Library          Collections
Library          SeleniumLibrary

Library          DataDriver    file=../data/home_page.csv

Resource         ../resources/common.robot
Resource         ../resources/home_page.robot

Suite Setup      Create Chrome Options

Test Setup       Navigate to Home Page
Test Teardown    Close All Browsers

Test Tags        Home Page

Test Template    Check Home Page Selection

*** Variables ***


*** Test Cases ***
Select Vehicle    ${AUTOMOBILE_SELECTION_ID}    Automobile    Automobile Insurance    


*** Keywords ***
Check Home Page Selection
    [Documentation]    Keyword to verify the vehicle selection in the home page
    [Arguments]        ${selection_id}    ${vehicle_type}    ${next_page_text}

    Wait Until Element Contains      ${selection_id}    ${vehicle_type}
    Wait Until Element Is Enabled    ${selection_id}    10s
    Click Element                    ${selection_id}

    Wait Until Page Contains         ${next_page_text}
