*** Settings ***

Library          Collections
Library          SeleniumLibrary

Resource         ../common.resource

# Library          DataDriver    file=../data/home_page.csv

*** Variables ***
${HOME_PAGE_ENTRY_URL}        https://sampleapp.tricentis.com/101/index.php
${AUTOMOBILE_DATA_ENTRY_TITLE}      Enter Vehicle Data

#Feedback messages for text inputs
${ENG_PERFORMANCE_MSG1}        This field is mandatory
${ENG_PERFORMANCE_MSG2}        Must be a number between 1 and 2000
${DATE_OF_MANUFACTURE_MSG1}    This field is mandatory
${DATE_OF_MANUFACTURE_MSG2}    Must be a valid date
${LIST_PRICE_MSG1}             This field is mandatory
${LIST_PRICE_MSG2}             Must be a number between 500 and 100000
${ANNUAL_MILEAGE_MSG1}         This field is mandatory
${ANNUAL_MILEAGE_MSG2}         Must be a number between 100 and 100000
#Locators
${MAKE_SELECTION}               make
${ENG_PERFORMANCE_INPUT}        engineperformance        
${DATE_OF_MANUFACTURE_INPUT}    dateofmanufacture
${NB_SEATS_SELECTION}           numberofseats
${FUEL_SELECTION}               fuel
${LIST_PRICE_INPUT}             listprice
${ANNUAL_MILEAGE_INPUT}         annualmileage
#Input values
${MAKE_SELECTION_LABEL}             Audi
${ENG_PERFORMANCE_INPUT_VAL}        1
${DATE_OF_MANUFACTURE_INPUT_VAL}    05/05/2025
${NB_SEATS_SELECTION_LABEL}         1
${FUEL_SELECTION_LABEL}                   Petrol
${LIST_PRICE_INPUT_VAL}             500
${ANNUAL_MILEAGE_INPUT_VAL}         100


*** Keywords ***
Navigate to Automobile Data Entry Page
    [Documentation]    Keyword to open the chrome browser and navigate to the Automobile Data Entry Page
    Open Browser       url=${HOME_PAGE_ENTRY_URL}   browser=${BROWSER}    options=${OPTIONS}

    Wait Until Element Contains      id=nav_automobile    text=Automobile
    Wait Until Element Is Enabled    id=nav_automobile    10s
    Click Element                    id=nav_automobile

    Wait Until Page Contains         text=Automobile Insurance

