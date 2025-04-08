*** Settings ***
Library     SeleniumLibrary
Resource    CommonKeywords.robot


*** Keywords ***
user input for register with ${email} and ${password} and ${confirmPassword}
    CommonKeywords.Wait until element is ready the go to url  https://dev.app.agnoshealth.com/ai_dashboard/agnos/sign_up/
    CommonKeywords.Wait until element is ready then input text    id=Email    ${email}
    CommonKeywords.Wait until element is ready then input text    id=password    ${password}
    CommonKeywords.Wait until element is ready then input text
    ...    xpath=/html/body/div/div/div/div/div[2]/div[2]/div[3]/input
    ...    ${confirmPassword}
    CommonKeywords.Wait until element is ready then click element
    ...    xpath=//*[@id="root"]/div/div/div/div[2]/div[3]/button/div
    Sleep  2s

agnos health should display display validate login fail message as "${expected_message}"
    CommonKeywords.Wait until page contains element then verify text    ${expected_message}

user click show password register to agnos health with ${password}
    CommonKeywords.Wait until element is ready then input text    id=password    ${password}
    CommonKeywords.Wait until element is ready then click element
    ...    xpath=/html/body/div/div/div/div/div[2]/div[2]/div[2]/img

user click show ConfirmPassword register to agnos health with ${ConfirmPassword}
    CommonKeywords.Wait until element is ready then input text    xpath=/html/body/div/div/div/div/div[2]/div[2]/div[3]/input    ${ConfirmPassword}
    CommonKeywords.Wait until element is ready then click element
    ...    xpath=/html/body/div/div/div/div/div[2]/div[2]/div[3]/img