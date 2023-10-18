*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Resource  ../steps_definitions/submit_application_steps.robot
Resource  ../resources/page_keywords/utility_keywords.robot

Test Setup  open optimy identification web application
Test Teardown  close browser

*** Test Cases ***
user is successfully submitted application form using valid values
    Given user is on the application form page
    When user fills out the form with valid values
    And user validates the values in summary are all correct and submits the form
    Then user should be submitted the application form successfully