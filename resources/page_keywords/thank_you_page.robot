*** Settings ***
Resource  utility_keywords.robot
Variables  ../page_locators/thank_you_page.py

*** Keywords ***
validate messages on success submission of form are present
    get and compare the text of the element    ${thnk_you_pg_header_text}    Thank you for submitting your project
    get and compare the text of the element    ${thnk_you_pg_thank_you_text}    The selection process will start and we will respond as soon as possible.