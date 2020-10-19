** Settings ***
Library AppiumLibrary

*** Variables ***
${REMOTE_URL}   http://localhost:4723/wd/hub
${package}      com.vapormedia.virtualsports.newsafl
*** Keywords ***
TestStart
    Open Application    ${REMOTE_URL}   deviceName=0.0.0.0:4723  app=${CURDIR}/Test_v4.0_apkpure.com.apk   automationName=appium   appActivity=com.newscorp.supercoach.SplashScreenActivity    appPackage=${package}

*** Test Cases ***
Login Successfully
    TestStart
    Wait Until Page Contains Element    id=${package}:id/email    timeout=60
    Click Element   id=${package}:id/email
    Input Text  id=${package}:id/email    myemail@news.com.au
    Click Element   id=${package}:id/password
    Input Password  id=${package}:id/password mypassword
    Hide Keyboard
    Click Element   
    Page Should Contain Text    Android NewLine Learning
    Capture Page Screenshot logged-in.png
