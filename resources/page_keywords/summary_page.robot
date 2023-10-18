*** Settings ***
Resource  utility_keywords.robot
Variables  ../page_locators/summary_page.py

*** Keywords ***
click validate and send button
    scroll and click using javascript    ${smmry_pg_validate_and_send_btn}