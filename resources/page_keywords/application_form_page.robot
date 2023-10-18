*** Settings ***
Resource  utility_keywords.robot
Library  String
Variables  ../page_locators/application_form_page.py


*** Keywords ***
enter first name
    [Arguments]    ${first_name}=Juan
    clean and enter text    ${applctn_frm_pg_first_name_fld}    ${first_name}

enter last name
    [Arguments]    ${last_name}=Tamad
    clean and enter text    ${applctn_frm_pg_last_name_fld}    ${last_name}

enter extension
    [Arguments]    ${extension}=Jr
    clean and enter text    ${applctn_frm_pg_extension_fld}    ${extension}

enter address
    [Arguments]    ${address}=Address St. Phase
    clean and enter text    ${applctn_frm_pg_address_fld}    ${address}

enter and select postal code
    [Arguments]    ${postal_code}=1000
    clean and enter text    ${applctn_frm_pg_postal_code_fld}    ${postal_code}
    click the element    ${applctn_frm_pg_postal_code_first_value}

select country
    [Arguments]    ${country_text}=Alaska
    scroll and click using javascript    ${applctn_frm_pg_country_drp_down}
    select from list by label    ${applctn_frm_pg_country_drp_down}    ${country_text}

upload file
    [Arguments]    ${file_name}=app_form_photo.png
    Choose File    ${applctn_frm_pg_upload_btn}    ${EXECDIR}/resources/test_data/${file_name}
    wait until element is visible    ${applctn_frm_pg_success_loc}

select gender using display text
    [Arguments]  ${gender}=Male
    click the element when expected text is present in the elements    ${applctn_frm_pg_gender_choices_radio_btns}    ${gender}

select role applying for
    [Arguments]    ${role_text}=Manual tester
    select from list by label    ${applctn_frm_pg_role_app_for_drp_down}    ${role_text}

select tool using text
    [Arguments]    ${tool}=JIRA
    click the element when expected text is present in the elements    ${applctn_frm_pg_tools_radio_btns}    ${tool}

enter career objectives
    [Arguments]  ${carrer_obj}=I want to be a SME for Automation testing\n I want to be you.
    scroll and click using javascript    ${applctn_frm_pg_career_obj_template}
    select Frame    ${applctn_frm_pg_career_obj_iframe}
    clean and enter text    ${applctn_frm_pg_career_obj_txt_box}    ${carrer_obj}
    unselect Frame

click next screen button
    scroll and click using javascript    ${applctn_frm_pg_next_screen_btn}