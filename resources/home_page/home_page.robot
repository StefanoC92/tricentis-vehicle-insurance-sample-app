*** Settings ***
Documentation    Test Suite for testing the 'Register User' functionality

Library          Collections
Library          SeleniumLibrary

# Library          DataDriver    file=../data/home_page.csv

*** Variables ***
${AUTOMOBILE_SELECTION_ID}    nav_automobile
${TRUCK_SELECTION_ID}         nav_truck
${MOTORCYCLE_SELECTION_ID}    nav_motorcycle
${CAMPER_SELECTION_ID}        nav_camper

*** Keywords ***


