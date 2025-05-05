*** Settings ***
Documentation    Test Suite for testing the Automobile Data Entry Page - Vehicle Data

Library          Collections
Library          SeleniumLibrary

# Library          DataDriver    file=../../data/automobile_data_entry_page/vehicle_data/valid.csv

Resource         ../../resources/common.resource
Resource         ../../resources/automobile_data_entry_page/vehicle_data.resource

Suite Setup      Create Chrome Options

Test Setup       Navigate to Automobile Data Entry Page
Test Teardown    Close All Browsers

Test Tags        Automobile Data Entry Page

# Test Template    Check Home Page Selection

*** Variables ***


*** Test Cases ***
Enter Valid Vehicle Data
    [Documentation]    Keyword to verify the valid data entry process
    #Make entry
    Select From List By Label     id=${MAKE_SELECTION}    ${MAKE_SELECTION_LABEL} 
    #Engine performance entry
    Wait Until Element Is Enabled    id=${ENG_PERFORMANCE_INPUT}
    Click Element                    id=${ENG_PERFORMANCE_INPUT}
    Page Should Contain              text=${ENG_PERFORMANCE_MSG1}    
    Input Text                       id=${ENG_PERFORMANCE_INPUT}    ${ENG_PERFORMANCE_INPUT_VAL}
    #TODO: Page Should Not Contain          text=${ENG_PERFORMANCE_MSG2}    
    #Date of manufacture entry
    Wait Until Element Is Enabled    id=${DATE_OF_MANUFACTURE_INPUT}
    Click Element                    id=${DATE_OF_MANUFACTURE_INPUT}    
    Page Should Contain              text=${DATE_OF_MANUFACTURE_MSG1}    
    Input Text                       id=${DATE_OF_MANUFACTURE_INPUT}    text=${DATE_OF_MANUFACTURE_INPUT_VAL}
    Page Should Not Contain          text=${DATE_OF_MANUFACTURE_MSG2}    
    #Number of seats entry
    Select From List By Label        id=${NB_SEATS_SELECTION}    ${NB_SEATS_SELECTION_LABEL} 
    #Fuel type entry
    Select From List By Label        id=${FUEL_SELECTION}    ${FUEL_SELECTION_LABEL} 
    #List price entry
    Wait Until Element Is Enabled    id=${LIST_PRICE_INPUT}
    Click Element                    id=${LIST_PRICE_INPUT}    
    Page Should Contain              text=${LIST_PRICE_MSG1}    
    Input Text                       id=${LIST_PRICE_INPUT}    text=${LIST_PRICE_INPUT_VAL}
    #TODO: Page Should Not Contain          text=${LIST_PRICE_MSG2} 
    #Annual mileage entry
    Wait Until Element Is Enabled    id=${ANNUAL_MILEAGE_INPUT}
    Click Element                    id=${ANNUAL_MILEAGE_INPUT}    
    Page Should Contain              text=${ANNUAL_MILEAGE_MSG1}    
    Input Text                       id=${ANNUAL_MILEAGE_INPUT}    text=${ANNUAL_MILEAGE_INPUT_VAL}
    #TODO: Page Should Not Contain          text=${ANNUAL_MILEAGE_MSG2} 



*** Keywords ***

