*** Settings ***
Library    AppiumLibrary

*** Variables ***
${APPIUM_SERVER}    http://localhost:4723/wd/hub
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    11.0
${DEVICE_NAME}    emulator-5554
${APP}    /path/to/lion_parcel.apk
${APP_PACKAGE}    com.lionparcel.app
${APP_ACTIVITY}    com.lionparcel.app.MainActivity

*** Test Cases ***
Positive Test Case for Cek Tarif
    [Tags]    mobile    positive
    Given I open Lion Parcel app
    When I navigate to Cek Tarif menu
    And I fill valid tariff check information
    Then the tariff result should be displayed

Negative Test Case for Cek Tarif
    [Tags]    mobile    negative
    Given I open Lion Parcel app
    When I navigate to Cek Tarif menu
    And I leave fields empty and submit
    Then an error message should be displayed

*** Keywords ***
I open Lion Parcel app
    Open Application    ${APPIUM_SERVER}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${APP}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    automationName=UiAutomator2

I navigate to Cek Tarif menu
    Wait Until Element Is Visible    id=menu_cek_tarif    10s
    Click Element    id=menu_cek_tarif

I fill valid tariff check information
    Input Text    id=origin_input    Jakarta
    Input Text    id=destination_input    Surabaya
    Input Text    id=weight_input    1
    Click Element    id=check_rate_button

The tariff result should be displayed
    Wait Until Element Is Visible    id=rate_result    10s
    Element Should Contain Text    id=rate_result    Rp

I leave fields empty and submit
    Click Element    id=check_rate_button

An error message should be displayed
    Wait Until Element Is Visible    id=error_message    5s
    Element Should Contain Text    id=error_message    required

[Teardown]    Close Application