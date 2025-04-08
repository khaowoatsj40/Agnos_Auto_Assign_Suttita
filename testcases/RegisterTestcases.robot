*** Settings ***
Library             SeleniumLibrary
Resource            ../keywords/RegisterPageKeywords.robot
Resource            ../keywords/HomePageKeywords.robot
Variables           ../resources/config/config.yaml
Variables           ../resources/testdata/testdata.yaml

Suite Setup         Open Browser    ${signupUrl}    chrome
Suite Teardown      Close Browser


*** Test Cases ***
1.ตรวจสอบหน้าลงทะเบียนของเว็บไซต์
    agnos health should display home page and display message as "Create Account"

2.ตรวจสอบการแสดงช่องกรอก "email"
    Wait until element is ready then click element is visible    id=Email

3.ตรวจสอบการแสดงช่องกรอก "password"
    Wait until element is ready then click element is visible    id=password

4.ตรวจสอบการกดแสดง password
    When user click show password register to agnos health with ${password}
    Then Wait until element is ready then check type input by id    password

5.ตรวจสอบการแสดงช่องกรอก "confirmPassword"
    Wait until element is ready then click element is visible
    ...    xpath=/html/body/div/div/div/div/div[2]/div[2]/div[3]/input

6.ตรวจสอบการกดแสดง "confirmPassword"
    When user click show ConfirmPassword register to agnos health with ${ConfirmPassword}
    Then Wait until element is ready then check type input by locator
    ...    xpath=/html/body/div/div/div/div/div[2]/div[2]/div[3]/input

7.ตรวจสอบการแสดงปุ่ม "Sign in" ตรวจสอบการแสดงปุ่ม "Confirm" กรณีที่ยังไม่มีการกรอก email password และ confirmPassword ปุ่ม Disable
    agnos health Wait until element is ready then check if button is disabled
    ...    xpath=/html/body/div/div/div/div/div[2]/div[3]/button

8.ตรวจสอบการลงทะเบียนสำเสร็จ โดยกรอกข้อมูลครบถ้วน
   When user input for register with ${email} and ${password} and ${confirmPassword}
   Then agnos health should display home page and display message as "Log-in"

9.ตรวจสอบการลงทะเบียนไม่สำเสร็จ โดยกรอกรูปแบบ "email" ไม่ถูกต้อง
   When user input for register with ${invalid_email_format} and ${password} and ${confirmPassword}
   Then agnos health should display home page and display message as "The email should be in the format 'test@example.com"

10.ตรวจสอบการลงทะเบียนสำเสร็จ โดยกรอกรูปแบบ "email" ถูกต้อง
   When user input for register with ${email} and ${password} and ${confirmPassword}
   Then agnos health should display home page and display message as "Log-in"

11.ตรวจสอบการลงทะเบียนไม่สำเสร็จ โดยกรอก "email ซ้ำกับที่มีอยู่ในระบบ [ยกเลิก]
    Skip    This test case is skipped.

12.ตรวจสอบการลงทะเบียนไม่สำเสร็จ โดยกรอก "password" 5 ตัว
   When user input for register with ${email} and ${invalid_password} and ${confirmPassword}
   Then agnos health should display home page and display message as "least 8"

13.ตรวจสอบการลงทะเบียนไม่สำเสร็จ โดย "password" ไม่มีการกรอก ตัวอักษรพิมพ์ใหญ่
   When user input for register with ${email} and "oa123456@" and ${confirmPassword}
   Then agnos health should display home page and display message as "uppercase"

14.ตรวจสอบการลงทะเบียนไม่สำเสร็จ โดย "password" ไม่มีการกรอก ตัวเลข
   When user input for register with ${email} and "Oadefdsa@" and ${confirmPassword}
   Then agnos health should display home page and display message as "digit"

15.ตรวจสอบการลงทะเบียนไม่สำเสร็จ โดย "password" ไม่มีการกรอก ตัวอักขระพิเศษ
   When user input for register with ${email} and "Oa1234567" and ${confirmPassword}
   Then agnos health should display home page and display message as "special"

16.ตรวจสอบการลงทะเบียนสำเสร็จ โดยกรอกรูปแบบ "password" ถูกต้อง
   When user input for register with ${email} and ${password} and ${confirmPassword}
   Then agnos health should display home page and display message as "Log-in"

17.ตรวจสอบการลงทะเบียนไม่สำเสร็จ โดยกรอก "confirmPassword" ไม่ตรงกับ "password"
   When user input for register with ${email} and ${password} and ${invalid_password}
   Then agnos health should display home page and display message as "Confirm password does not match the password."

18.ตรวจสอบการลงทะเบียนสำเสร็จ โดยกรอก "confirmPassword" ตรงกับ "password"
   When user input for register with ${email} and ${password} and ${confirmPassword}
   Then agnos health should display home page and display message as "Log-in"