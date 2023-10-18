*** Settings ***
Resource  utility_keywords.robot
Variables  ../page_locators/login_page.py

*** Keywords ***
enter email address
    [Arguments]    ${email_address}=sample@gmail.com
    clean and enter text    ${lgn_pg_email_fld}    ${email_address}

enter password
    [Arguments]    ${password}=password
    clean and enter text    ${lgn_pg_password_fld}    ${password}

click login button
    click the element    ${lgn_pg_login_btn}