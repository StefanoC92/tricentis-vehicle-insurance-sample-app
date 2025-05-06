*** Settings ***

Library          Collections
Library          SeleniumLibrary

Library          ../../libraries/custom.py

Resource         ../common.resource

# Library          DataDriver    file=../data/home_page.csv

*** Variables ***
${HOME_PAGE_ENTRY_URL}              https://sampleapp.tricentis.com/101/index.php
${AUTOMOBILE_DATA_ENTRY_TITLE}      Enter Vehicle Data

#Locators
${MAKE_SELECTION}               make
${ENG_PERFORMANCE_INPUT}        engineperformance        
${DATE_OF_MANUFACTURE_INPUT}    dateofmanufacture
${NB_SEATS_SELECTION}           numberofseats
${FUEL_SELECTION}               fuel
${LIST_PRICE_INPUT}             listprice
${ANNUAL_MILEAGE_INPUT}         annualmileage

*** Keywords ***
Navigate to Automobile Data Entry Page
    [Documentation]    Keyword to open the chrome browser and navigate to the Automobile Data Entry Page
    Open Browser       url=${HOME_PAGE_ENTRY_URL}   browser=${BROWSER}    options=${OPTIONS}

    Wait Until Element Contains      id=nav_automobile    text=Automobile
    Wait Until Element Is Enabled    id=nav_automobile    10s
    Click Element                    id=nav_automobile

    Wait Until Page Contains         text=Automobile Insurance

The Entry Should Be Valid
    [Documentation]    This keywords allows to first take the screenshot of the element under inspection,
    ...                then, it compares it with the expected layout, finally returns None if the comparison
    ...                is successfull, otherwise it raises an Exception.
    [Arguments]        ${element_locator}    ${actual_img_filename}    ${expected_img_filename} 

    Capture Element Screenshot    ${element_locator}    image_comparison/${actual_img_filename}
    Compare Images    ${actual_img_filename}    ${expected_img_filename}
