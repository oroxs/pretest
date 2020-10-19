** Settings ***
Library AppiumLibrary

*** Variables ***
${REMOTE_URL}   http://localhost:4723/wd/hub
${package}      com.loginmodule.learning
${activity}     com.loginmodule.learning.activities.LoginActivity

*** Keywords ***
TestStart
    Open Application    ${REMOTE_URL}   deviceName=0.0.0.0:4723  app=${CURDIR}/Test_v4.0_apkpure.com.apk   automationName=appium   appActivity=${activity}    appPackage=${package}

*** Test Cases ***
Login Successfully
    TestStart
    Wait Until Page Contains Element    id=${package}:id/email    timeout=60
    Click Element   id=${package}:id/email
    Input Text  id=${package}:id/email    myemail@news.com.au
    Click Element   id=${package}:id/password
    Input Password  id=${package}:id/password mypassword
    Hide Keyboard
    Click Element   id/login
    Page Should Contain Text    Android NewLine Learning
    Capture Page Screenshot logged-in.png

Login Failed
    TestStart
    Wait Until Page Contains Element    id=${package}:id/email    timeout=60
    Click Element   id=${package}:id/email
    Input Text  id=${package}:id/email    myemail@news
    Click Element   id=${package}:id/password
    Input Password  id=${package}:id/password mypassword
    Hide Keyboard
    Click Element   id=${package}:id/login
    Page Should Contain Text    Wrong Email or Password
    Wait Until Page Contains Element    xpath=//input[@type='email']

    Capture Page Screenshot logged-in.png
