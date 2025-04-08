*** Settings ***
Library             SeleniumLibrary
Resource            ../keywords/LoginPageKeywords.robot
Resource            ../keywords/HomePageKeywords.robot
Variables           ../resources/config/config.yaml
Variables           ../resources/testdata/testdata.yaml

Suite Setup         Open Browser    ${loginUrl}    chrome
Suite Teardown      Close Browser


*** Test Cases ***
1.ตรวจสอบการแสดง tab
    When user login to agnos health success with ${emailLogin} and ${passwordLogin}
    Then agnos health should display home page and display message as "นาย Tests Agnos"
    
2.ตรวจสอบการแสดง ผู้ใช้งาน ในtab
    agnos health should display home page and display message as "นาย Tests Agnos"

3.ตรวจสอบการแสดง หัวข้อ ในtab 
    agnos health should display home page and display message as "Diagnosis List"

4.ตรวจสอบการแสดง ออกจากระบบ ในtab
    agnos health should display home page and display message as "Log Out"
    [Teardown]    user logout from agnos health

5.ตรวจสอบการ กด tab User statistics [ยกเลิก]
    Skip    This test case is skipped.

6.ตรวจสอบการ กด tab Diagnosis Statistics [ยกเลิก]
    Skip    This test case is skipped.

7.ตรวจสอบการ กด tab Diagnosis mismatch [ยกเลิก]
    Skip    This test case is skipped.

8.ตรวจสอบการ กด tab Diagnosis List [ยกเลิก]
    Skip    This test case is skipped.

9.ตรวจสอบการออกจากระบบ
    When user login to agnos health success with ${emailLogin} and ${passwordLogin}
    Then user logout from agnos health

