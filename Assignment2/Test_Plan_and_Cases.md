# Test Plan for SauceDemo Shopping Cart Checkout

## 1. Introduction
### 1.1 Purpose
This test plan outlines the testing approach for the user journey of shopping cart checkout on SauceDemo website.

### 1.2 Scope
- Login functionality
- Product browsing and selection
- Cart management
- Checkout process
- Order confirmation

### 1.3 Test Items
- SauceDemo website (https://www.saucedemo.com/)
- User credentials: standard_user / secret_sauce

## 2. Test Strategy
### 2.1 Testing Types
- Functional Testing
- UI Testing
- End-to-End Testing

### 2.2 Test Environment
- Browser: Chrome
- OS: macOS

## 3. Test Cases

### Test Case 1: Successful Login
**Preconditions:** User has valid credentials
**Steps:**
1. Navigate to https://www.saucedemo.com/
2. Enter username: standard_user
3. Enter password: secret_sauce
4. Click Login button
**Expected Result:** User is logged in and redirected to Products page

### Test Case 2: Add Items to Cart
**Preconditions:** User is logged in
**Steps:**
1. From Products page, click "Add to cart" for Sauce Labs Backpack
2. Click "Add to cart" for Sauce Labs Bike Light
3. Click shopping cart icon
**Expected Result:** Cart shows 2 items

### Test Case 3: Proceed to Checkout
**Preconditions:** Items are in cart
**Steps:**
1. From cart page, click "Checkout" button
**Expected Result:** Redirected to Checkout: Your Information page

### Test Case 4: Fill Checkout Information
**Preconditions:** On checkout information page
**Steps:**
1. Enter First Name: John
2. Enter Last Name: Doe
3. Enter Postal Code: 12345
4. Click Continue button
**Expected Result:** Redirected to Checkout: Overview page with order summary

### Test Case 5: Complete Order
**Preconditions:** On checkout overview page
**Steps:**
1. Click Finish button
**Expected Result:** Order completed, "Thank you for your order!" message displayed

## 4. Exit Criteria
- All test cases pass
- No critical defects
- Checkout flow works end-to-end