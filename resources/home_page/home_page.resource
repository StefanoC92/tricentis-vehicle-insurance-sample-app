*** Settings ***

Library          Collections
Library          SeleniumLibrary

Resource         ../common.resource

# Library          DataDriver    file=../data/home_page.csv

*** Variables ***
${HOME_PAGE_URL}        https://sampleapp.tricentis.com/101/
${HOME_PAGE_TITLE}      Tricentis Vehicle Insurance

${AUTOMOBILE_SELECTION_ID}    nav_automobile
${TRUCK_SELECTION_ID}         nav_truck
${MOTORCYCLE_SELECTION_ID}    nav_motorcycle
${CAMPER_SELECTION_ID}        nav_camper

*** Keywords ***
Navigate to Home Page
    [Documentation]    Keyword to open the chrome browser and navigate to home page
    Open Browser       url=${HOME_PAGE_URL}   browser=${BROWSER}    options=${OPTIONS}
    Title Should Be    ${HOME_PAGE_TITLE}  

