from appium import webdriver
from appium.webdriver.common.appiumby import AppiumBy
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

# Desired capabilities for Android
desired_caps = {
    "platformName": "Android",
    "platformVersion": "11.0",  # Adjust based on device
    "deviceName": "emulator-5554",  # Adjust based on device
    "app": "/path/to/lion_parcel.apk",  # Path to APK file
    "appPackage": "com.lionparcel.app",  # Adjust based on actual package
    "appActivity": "com.lionparcel.app.MainActivity",  # Adjust based on actual activity
    "automationName": "UiAutomator2"
}

def test_cek_tarif_positive():
    """Positive test case for Cek Tarif"""
    driver = webdriver.Remote("http://localhost:4723/wd/hub", desired_caps)

    try:
        # Wait for app to load
        WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((AppiumBy.ID, "menu_cek_tarif"))
        )

        # Click Cek Tarif menu
        cek_tarif_button = driver.find_element(AppiumBy.ID, "menu_cek_tarif")
        cek_tarif_button.click()

        # Fill origin
        origin_field = driver.find_element(AppiumBy.ID, "origin_input")
        origin_field.send_keys("Jakarta")

        # Fill destination
        dest_field = driver.find_element(AppiumBy.ID, "destination_input")
        dest_field.send_keys("Surabaya")

        # Fill weight
        weight_field = driver.find_element(AppiumBy.ID, "weight_input")
        weight_field.send_keys("1")

        # Click check rate
        check_button = driver.find_element(AppiumBy.ID, "check_rate_button")
        check_button.click()

        # Verify result
        WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((AppiumBy.ID, "rate_result"))
        )
        result = driver.find_element(AppiumBy.ID, "rate_result")
        assert "Rp" in result.text, "Rate should be displayed in Rupiah"

        print("Positive test passed")

    finally:
        driver.quit()

def test_cek_tarif_negative():
    """Negative test case for Cek Tarif - empty fields"""
    driver = webdriver.Remote("http://localhost:4723/wd/hub", desired_caps)

    try:
        WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((AppiumBy.ID, "menu_cek_tarif"))
        )

        cek_tarif_button = driver.find_element(AppiumBy.ID, "menu_cek_tarif")
        cek_tarif_button.click()

        # Leave fields empty and click check
        check_button = driver.find_element(AppiumBy.ID, "check_rate_button")
        check_button.click()

        # Verify error message
        WebDriverWait(driver, 5).until(
            EC.presence_of_element_located((AppiumBy.ID, "error_message"))
        )
        error = driver.find_element(AppiumBy.ID, "error_message")
        assert "required" in error.text.lower(), "Error message should indicate required fields"

        print("Negative test passed")

    finally:
        driver.quit()

if __name__ == "__main__":
    # Note: This requires Appium server running and device/emulator connected
    # Run: appium --address 127.0.0.1 --port 4723
    test_cek_tarif_positive()
    test_cek_tarif_negative()