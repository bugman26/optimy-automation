*** Settings ***
Resource  utility_keywords.robot
Variables  ../page_locators/landing_page.py

*** Keywords ***
click allow all cookies button
    click the element    ${lndng_pg_close_btn}

click submit an application button
    click the element    ${lndng_pg_submit_application_btn}