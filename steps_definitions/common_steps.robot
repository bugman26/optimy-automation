*** Settings ***
Resource  ../resources/page_keywords/landing_page.robot
Resource  ../resources/page_keywords/login_page.robot
Resource  ../resources/page_keywords/home_page.robot
Variables  ../resources/test_data/login.py

*** Keywords ***
user logs in with valid credentials
    click allow all cookies button
    click submit an application button
    enter email address    email_address=${lgn_data_email_add}
    enter password    password=${lgn_data_password}
    click login button