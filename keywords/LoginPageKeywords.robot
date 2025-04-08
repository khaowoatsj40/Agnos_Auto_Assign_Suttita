*** Settings ***
Library     SeleniumLibrary
Resource    CommonKeywords.robot

*** Keywords ***
user login input feild ${emailLogin} and ${passwordLogin}
    CommonKeywords.Wait until element is ready then input text    id=Email    ${emailLogin}
    CommonKeywords.Wait until element is ready then input text    id=password    ${passwordLogin}

user login to agnos health success with ${emailLogin} and ${passwordLogin}
    CommonKeywords.Wait until element is ready then input text    id=Email    ${emailLogin}
    CommonKeywords.Wait until element is ready then input text    id=password    ${passwordLogin}
    CommonKeywords.Wait until element is ready then click element
    ...    xpath=//*[@id="root"]/div/div/div/div[2]/div[3]/button/div

user click show password login to agnos health with ${passwordLogin}
    CommonKeywords.Wait until element is ready then input text    id=password    ${passwordLogin}
    CommonKeywords.Wait until element is ready then click element
    ...    xpath=//*[@id="root"]/div/div/div/div[2]/div[2]/div[2]/img

agnos health should display display validate login fail message as "${expected_message}"
    CommonKeywords.Wait until page contains element then verify text    ${expected_message}

user login to agnos health success with ${emailLogin} and ${passwordLogin} and clear specific key from local storage
    CommonKeywords.Wait until element is ready the go to url    https://dev.app.agnoshealth.com/ai_dashboard/login/
    CommonKeywords.Wait until element is ready then input text    id=Email    ${emailLogin}
    CommonKeywords.Wait until element is ready then input text    id=password    ${passwordLogin}
    CommonKeywords.Wait until element is ready then click element
    ...    xpath=//*[@id="root"]/div/div/div/div[2]/div[3]/button/div
    Execute JavaScript    window.localStorage.removeItem('session');
