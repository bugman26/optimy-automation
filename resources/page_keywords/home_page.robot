*** Settings ***
Resource  utility_keywords.robot
Variables  ../page_locators/home_page.py

*** Keywords ***
click submit a new application link
    scroll and click using javascript    ${hm_pg_submit_an_application_btn}