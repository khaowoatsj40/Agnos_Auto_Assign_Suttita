*** Settings ***
Library             SeleniumLibrary
Resource            ../keywords/LoginPageKeywords.robot
Resource            ../keywords/HomePageKeywords.robot
Variables           ../resources/config/config.yaml
Variables           ../resources/testdata/testdata.yaml

Suite Setup         Open Browser    ${loginUrl}    chrome
Suite Teardown      Close Browser


*** Test Cases ***
1.ตรวจสอบหน้าลงทะเบียนของเว็บไซต์
    agnos health should display home page and display message as "Log-in"

2.ตรวจสอบการแสดงช่องกรอก "email"
    Wait until element is ready then click element is visible    id=Email

3.ตรวจสอบการแสดงช่องกรอก "password"
    Wait until element is ready then click element is visible    id=password

4.ตรวจสอบการกดแสดง password
    When user click show password login to agnos health with ${passwordLogin}
    Then Wait until element is ready then check type input by id    password

5.ตรวจสอบการแสดงปุ่ม "Sign in" กรณีที่ยังไม่มีการกรอก email และ password ปุ่ม Disable
    agnos health Wait until element is ready then check if button is disabled
    ...    xpath=/html/body/div/div/div/div/div[2]/div[3]/button

6. ตรวจสอบการเข้าสู่ระบบด้วยการไม่กรอกข้อมูล "email" และ "password"
    When user login input feild ${inputNull} and ${inputNull}
    Then agnos health Wait until element is ready then check if button is disabled
    ...    xpath=/html/body/div/div/div/div/div[2]/div[3]/button

7.ตรวจสอบการเข้าสู่ระบบด้วยข้อมูลผู้ใช้งานที่ถูกต้อง
    When user login to agnos health success with ${emailLogin} and ${passwordLogin}
    Then agnos health should display home page and display message as "นาย Tests Agnos"
    [Teardown]    user logout from agnos health

8.ตรวจสอบการเข้าสู่ระบบด้วย "email" ที่ไม่ถูกต้อง
    When user login to agnos health success with ${invalid_email} and ${passwordLogin}
    Then agnos health should display display validate login fail message as "Wrong email or password. Please try again"

9.ตรวจสอบการกรอกรูปแบบ email ไม่ถูกต้อง
    When user login to agnos health success with ${invalid_email_format} and ${passwordLogin}
    Then agnos health should display display validate login fail message as "Wrong email or password. Please try again"

10.ตรวจสอบการเข้าสู่ระบบด้วย "password" ที่ไม่ถูกต้อง
    When user login to agnos health success with ${emailLogin} and ${invalid_password}
    Then agnos health should display display validate login fail message as "Wrong email or password. Please try again"

11.ตรวจสอบการเข้าสู่ระบบด้วย "email" และ "password" ที่ไม่ถูกต้อง
    When user login to agnos health success with ${invalid_email} and ${invalid_password}
    Then agnos health should display display validate login fail message as "Wrong email or password. Please try again"

12.ตรวจสอบการเข้าสู่ระบบด้วย "email" และ "password" ที่มีช่องว่าง
    When user login to agnos health success with ${invalid_email_space} and ${invalid_password_space}
    Then agnos health should display display validate login fail message as "Wrong email or password. Please try again"

13. ตรวจสอบการเข้าสู่ระบบด้วยผู้ใช้งานที่ถูกบล็อค [ยกเลิก]
    Skip    This test case is skipped.

14. ตรวจสอบการเข้าสู่ระบบผู้ใช้งานเกินจำนวนที่กำหนด [ยกเลิก]
    Skip    This test case is skipped.

15.ตรวจสอบการออกจากระบบ
    When user login to agnos health success with ${emailLogin} and ${passwordLogin}
    Then user logout from agnos health

16.ตรวจสอบการกลับไปยังหน้าจัดการ (ai_dashboard) หลังจากออกจากระบบ
    When Wait until element is ready the go to url    https://dev.app.agnoshealth.com/ai_dashboard
    Then agnos health should display home page and display message as "Log-in"

17.ตรวจสอบการออกจากระบบ
    When user login to agnos health success with ${emailLogin} and ${passwordLogin} and clear specific key from local storage
    Then agnos health should display home page and display message as "Log-in"
