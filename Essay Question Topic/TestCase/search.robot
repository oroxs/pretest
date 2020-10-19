*** settings ***
Library    Selenium2Library

*** Variables ***
${URL}      https://bukalapak.com
${Browser}  chrome
${keyword}  kembang tahu

*** Test Cases ***
[TC-001]Search From Homepage
    Launch Browser
    Homepage

*** Keywords ***
Launch Browser
    Open browser                        ${URL}  ${Browser}
    Maximize Browser Window

Homepage
    Capture Page Screenshot     filename=selenium-screenshot-{index}.png
    Input Text      //*[@id="v-omnisearch__input"]      ${keyword}
    Click Button    //*[@id="v-omnisearch"]/button
    Capture Page Screenshot     filename=selenium-screenshot-{index}.png
    page should contain     ${keyword}
    Close Browser