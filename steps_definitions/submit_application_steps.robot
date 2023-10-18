*** Settings ***
Library  Collections
Variables  ../resources/test_data/submit_application.py
Variables  ../resources/page_locators/summary_page.py
Resource  common_steps.robot
Resource  ../resources/page_keywords/application_form_page.robot
Resource  ../resources/page_keywords/summary_page.robot
Resource  ../resources/page_keywords/thank_you_page.robot

*** Keywords ***
user is on the application form page
    user logs in with valid credentials
    click submit a new application link

user fills out the form with valid values
    enter first name    first_name=${app_form_data_first_name}
    enter last name    last_name=${app_form_data_last_name}
    enter extension    extension=${app_form_data_extension}
    enter address    address=${app_form_data_address}
    enter and select postal code    postal_code=${app_form_data_postal_code}
    select country    country_text=${app_form_data_country}
    upload file    file_name=${app_form_data_file_name}
    select gender using display text    gender=${app_form_data_gender}
    select role applying for    role_text=${app_form_data_role}
    select tool using text    tool=${app_form_data_tools1}
    select tool using text    tool=${app_form_data_tools2}
    enter career objectives    carrer_obj=${app_form_data_career_obj}
    click next screen button

user validates the values in summary are all correct and submits the form
    ${actual_values_list}    get the list of text of the elements    ${smmry_pg_label_and_ans}
    List Should Contain Value    ${actual_values_list}    First name\n${app_form_data_first_name}
    List Should Contain Value    ${actual_values_list}    Last name\n${app_form_data_last_name}
    List Should Contain Value    ${actual_values_list}    Extension\n${app_form_data_extension}
    List Should Contain Value    ${actual_values_list}    Unit no/House no, Street\n${app_form_data_address}
    List Should Contain Value    ${actual_values_list}    Select postal code\n${app_form_data_postal_code} - Bruxelles / Brussel
    List Should Contain Value    ${actual_values_list}    Country\n${app_form_data_country}
    List Should Contain Value    ${actual_values_list}    Photo\n${app_form_data_file_name}
    List Should Contain Value    ${actual_values_list}    Gender\n${app_form_data_gender}
    List Should Contain Value    ${actual_values_list}    Select a role you're applying for\n${app_form_data_role}
    List Should Contain Value    ${actual_values_list}    Familiarity with tools, frameworks and programming languages\n${app_form_data_tools1}\n${app_form_data_tools2}
    List Should Contain Value    ${actual_values_list}    What is your career objective?\n${app_form_data_career_obj}
    click validate and send button

user should be submitted the application form successfully
    validate messages on success submission of form are present