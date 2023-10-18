*** Settings ***
Library  SeleniumLibrary
Library  ../custom_libraries/WebDriverManager.py

*** Variables ***
${test_url}    https://automationinterface1.front.${env}.optimy.net/en/

*** Keywords ***
open optimy identification web application
    ${driver_path}=    get driver path    ${browser_type}
    open browser    ${test_url}    ${browser_type}    executable_path=${driver_path}
    maximize browser window
    set selenium implicit wait  30s

click the element
    [Arguments]    ${locator}
    wait until element is visible  ${locator}  timeout=60s
    click element  ${locator}

scroll and click using javascript
    [Arguments]  ${selector}
    ${final_selector} =    Remove String    ${selector}    css:
    execute javaScript    document.querySelector("${final_selector}").scrollIntoView(true)
    execute javaScript    document.querySelector("${final_selector}").click()

clean and enter text
    [Arguments]    ${locator}    ${text}
    clear element text    ${locator}
    input text    ${locator}    ${text}

click the element when expected text is present in the elements
    [Arguments]    ${element_list}    ${text}
    @{elements} =    Get WebElements    ${element_list}
    FOR    ${element}    IN    @{elements}
        run keyword if    '${element.text}' == '${text}'    click the element    ${element}
        run keyword if    '${element.text}' == '${text}'    exit for loop
    END

get the list of text of the elements
    [Arguments]    ${element_list}
    @{elements} =    Get WebElements   ${element_list}
    ${elem_txt_list}    Create List
    FOR    ${element}    IN    @{elements}
        Append To List    ${elem_txt_list}    ${element.text}
    END
    [return]  ${elem_txt_list}

get and compare the text of the element
    [Arguments]    ${element}    ${expected_text}
    ${actual_text}=    Get Text    ${element}
    should be equal    ${actual_text.strip()}    ${expected_text}