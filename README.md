# SDET Test Assignments 2024

This repository contains solutions for the SDET recruitment test assignments.

## Assignments Overview

### Assignment 1: API Automation
- **Framework:** Robot Framework with Python
- **Style:** Gherkin (Given/When/Then)
- **API:** https://reqres.in/
- **Tests:** GET Single User, POST Create User
- **Location:** `Assignment1/api_tests.robot`

### Assignment 2: Web Automation & Test Documentation
- **Framework:** Robot Framework with Python, Selenium
- **Style:** Gherkin
- **Website:** https://www.saucedemo.com/
- **Tests:** Shopping cart checkout journey
- **Test Plan & Cases:** `Assignment2/Test_Plan_and_Cases.md`
- **Location:** `Assignment2/checkout_test.robot`

### Assignment 3: Programming Problem
- **Language:** Python
- **Problem:** Sort array with even numbers first then odd, descending order
- **Input:** [3,2,5,1,8,9,6]
- **Output:** [8,6,2,9,5,3,1]
- **Location:** `Assignment3/sort_function.py`

### Assignment 4: Mobile Automation
- **Frameworks:** Appium with Python, Robot Framework with Appium
- **App:** Lion Parcel (Android/iOS)
- **Feature:** Cek Tarif menu
- **Test Cases:** Positive and negative scenarios
- **Locations:** `Assignment4/appium_test.py`, `Assignment4/mobile_test.robot`

## Prerequisites

### For API and Web Testing:
```bash
pip install robotframework robotframework-requests robotframework-seleniumlibrary
```

### For Mobile Testing:
```bash
pip install Appium-Python-Client robotframework-appiumlibrary
# Also need Appium server: npm install -g appium
# And UiAutomator2: appium driver install uiautomator2
```

### For Web Testing:
- ChromeDriver (installed via brew)

## Running Tests

### Assignment 1:
```bash
cd Assignment1
robot api_tests.robot
```

### Assignment 2:
```bash
cd Assignment2
robot checkout_test.robot
```

### Assignment 3:
```bash
cd Assignment3
python3 sort_function.py
```

### Assignment 4:
- Requires Appium server running and mobile device/emulator
- Update app path and capabilities in the scripts
```bash
cd Assignment4
python3 appium_test.py
# or
robot mobile_test.robot
```

## Notes
- Mobile testing requires actual app APK/IPA and proper device setup
- Update file paths and app details as needed
- Screen recordings for Assignment 4 should be created separately