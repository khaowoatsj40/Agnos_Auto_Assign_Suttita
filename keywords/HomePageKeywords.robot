*** Settings ***
Library     SeleniumLibrary
Resource    CommonKeywords.robot


*** Keywords ***
agnos health should display home page and display message as "${expected_message}"
    CommonKeywords.Wait until page contains element then verify text    ${expected_message}

user logout from agnos health
    CommonKeywords.Wait until element is ready then click element    xpath=//div[contains(text(),"Log Out")]

    
