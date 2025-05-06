*** Settings ***
Documentation    Test Suite for testing the Automobile Data Entry Page - Vehicle Data

Library          Collections
Library          SeleniumLibrary

Library          DataDriver    file=../../data/automobile_data_entry_page/vehicle_data/vehicle_data.csv

Resource         ../../resources/common.resource
Resource         ../../resources/automobile_data_entry_page/vehicle_data.resource

Suite Setup      Create Chrome Options

Test Setup       Navigate to Automobile Data Entry Page
Test Teardown    Close All Browsers

Test Tags        Automobile Data Entry Page

Test Template    Validate Vehicle Data Entries

*** Variables ***

*** Test Cases ***
Enter Vehicle Data    ${EMPTY}    ${EMPTY} 
    ...               ${EMPTY}    ${EMPTY}
    ...               ${EMPTY}    ${EMPTY}
    ...               ${EMPTY}    ${EMPTY}
    ...               ${EMPTY}    ${EMPTY}
    ...               ${EMPTY}    ${EMPTY}
    ...               ${EMPTY}    ${EMPTY}


*** Keywords ***
Validate Vehicle Data Entries
    [Documentation]    Keyword for Test Template to verify the data entry validity
    [Arguments]        ${make_selection_label}   ${make_selection_expected_icon} 
    ...                ${eng_perf_input_val}     ${eng_perf_expected_icon}
    ...                ${date_of_manufacture_input_val}    ${date_of_manufacture_expected_icon}
    ...                ${nb_seats_label}    ${nb_seats_expected_icon}
    ...                ${fuel_selection_label}    ${fuel_selection_expetced_icon}    
    ...                ${list_price_input_val}    ${list_price_expected_icon}
    ...                ${annual_mileage_input_val}    ${annual_mileage_expected_icon}
    
    #Make entry
    Select From List By Value     id=${MAKE_SELECTION}    ${make_selection_label} 
    The Entry Should Be Valid    
    ...    //*[@id="insurance-form"]/div/section[1]/div[1]/i
    ...    actual_icon_make.png    
    ...    ${make_selection_expected_icon}

    # #Engine performance entry
    Wait Until Element Is Enabled    id=${ENG_PERFORMANCE_INPUT}
    Click Element                    id=${ENG_PERFORMANCE_INPUT}
    Input Text                       id=${ENG_PERFORMANCE_INPUT}    ${eng_perf_input_val}
    The Entry Should Be Valid    
    ...    //*[@id="insurance-form"]/div/section[1]/div[2]/i
    ...    actual_icon_eng_perf.png    
    ...    ${eng_perf_expected_icon}
      
    #Date of manufacture entry
    Wait Until Element Is Enabled    id=${DATE_OF_MANUFACTURE_INPUT}
    Click Element                    id=${DATE_OF_MANUFACTURE_INPUT}    
    Input Text                       id=${DATE_OF_MANUFACTURE_INPUT}    text=${date_of_manufacture_input_val}
    The Entry Should Be Valid    
    ...    //*[@id="insurance-form"]/div/section[1]/div[3]/i
    ...    actual_icon_date_of_manufacture.png    
    ...    ${date_of_manufacture_expected_icon}   
    
    #Number of seats entry
    Select From List By Value        id=${NB_SEATS_SELECTION}    ${nb_seats_label} 
    The Entry Should Be Valid    
    ...    //*[@id="insurance-form"]/div/section[1]/div[4]/i
    ...    actual_icon_nb_seats.png    
    ...    ${nb_seats_expected_icon}
    
    #Fuel type entry
    Select From List By Value        id=${FUEL_SELECTION}    ${fuel_selection_label} 
    The Entry Should Be Valid    
    ...    //*[@id="insurance-form"]/div/section[1]/div[5]/i
    ...    actual_icon_fuel.png    
    ...    ${fuel_selection_expetced_icon}
    
    # List price entry
    Wait Until Element Is Enabled    id=${LIST_PRICE_INPUT}
    Click Element                    id=${LIST_PRICE_INPUT}    
    Input Text                       id=${LIST_PRICE_INPUT}    text=${list_price_input_val}
    The Entry Should Be Valid    
    ...    //*[@id="insurance-form"]/div/section[1]/div[6]/i
    ...    actual_icon_list_price.png    
    ...    ${list_price_expected_icon}
    
    # Annual mileage entry
    Wait Until Element Is Enabled    id=${ANNUAL_MILEAGE_INPUT}
    Click Element                    id=${ANNUAL_MILEAGE_INPUT}    
    Input Text                       id=${ANNUAL_MILEAGE_INPUT}    text=${annual_mileage_input_val}
    The Entry Should Be Valid    
    ...    //*[@id="insurance-form"]/div/section[1]/div[8]/i
    ...    actual_icon_annual_mileage.png    
    ...    ${annual_mileage_expected_icon}
