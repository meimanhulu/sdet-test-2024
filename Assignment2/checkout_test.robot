*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/
${USERNAME}    standard_user
${PASSWORD}    secret_sauce
${BROWSER}    Chrome
${HEADLESS}    --headless

*** Test Cases ***
Complete Shopping Cart Checkout
    [Tags]    web    checkout
    Given I open the browser and navigate to SauceDemo
    When I login with valid credentials
    And I add items to the cart
    And I proceed to checkout
    And I fill checkout information
    And I complete the order
    Then the order should be confirmed
    [Teardown]    Close Browser

*** Keywords ***
I open the browser and navigate to SauceDemo
    Open Browser    ${URL}    ${BROWSER}    options=${HEADLESS}
    Maximize Browser Window

I login with valid credentials
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button
    Wait Until Page Contains    Products

I add items to the cart
    Click Button    xpath=//button[@data-test='add-to-cart-sauce-labs-backpack']
    Click Button    xpath=//button[@data-test='add-to-cart-sauce-labs-bike-light']
    Click Link    xpath=//a[@class='shopping_cart_link']
    Wait Until Page Contains    Your Cart

I proceed to checkout
    Click Button    id=checkout
    Wait Until Page Contains    Checkout: Your Information

I fill checkout information
    Input Text    id=first-name    John
    Input Text    id=last-name    Doe
    Input Text    id=postal-code    12345
    Click Button    id=continue
    Wait Until Page Contains    Checkout: Overview

I complete the order
    Click Button    id=finish
    Wait Until Page Contains    Checkout: Complete!

The order should be confirmed
    Page Should Contain    Thank you for your order!