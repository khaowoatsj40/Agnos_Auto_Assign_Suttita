*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
Wait until element is ready then click element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    2s    Click Element    ${locator}

Wait until element is ready then input text
    [Arguments]    ${locator}    ${text}
    Wait Until Keyword Succeeds    5x    2s    Input Text    ${locator}    ${text}

Wait until page contains element then verify text
    [Arguments]    ${expected_text}
    Wait Until Keyword Succeeds    5x    2s    Page Should Contain    ${expected_text}

Wait until element is ready then check type input by id
    [Arguments]    ${id}
    ${input_type}=    Get Dom Attribute    id=${id}    type
    Wait Until Keyword Succeeds    5x    2s    Should Be Equal As Strings    ${input_type}    text

Wait until element is ready then check type input by locator
    [Arguments]    ${locator}
    ${input_type}=    Get Dom Attribute    ${locator}    type
    Wait Until Keyword Succeeds    5x    2s    Should Be Equal As Strings    ${input_type}    text

agnos health Wait until element is ready then check if button is disabled
    [Arguments]    ${locator}
    ${is_disabled}=    Get Dom Attribute    ${locator}    disabled
    Wait Until Keyword Succeeds    5x    2s    Should Be Equal As Strings    ${is_disabled}    true

Wait until element is ready then click element is visible
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    Element Should Be Visible    ${locator}

Wait until element is ready the go to url
    [Arguments]    ${url}
    Go To    ${url}
