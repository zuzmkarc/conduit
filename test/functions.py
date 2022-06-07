import time
from test_data import test_user
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait


def login(browser, email, password):
    sign_in_btn = browser.find_element_by_xpath('//a[@href="#/login"]')
    sign_in_btn.click()
    time.sleep(5)

    email_field = browser.find_element_by_xpath('//input[@type="text"]')
    email_field.send_keys(email)

    password_field = browser.find_element_by_xpath('//input[@type="password"]')
    password_field.send_keys(password)

    login_btn = browser.find_element_by_xpath('//button[@class="btn btn-lg btn-primary pull-xs-right"]')
    login_btn.click()
    time.sleep(5)


def click_logged_in_user_name(browser):
    logged_in_user_name = WebDriverWait(browser, 5).until(
        EC.presence_of_element_located((By.XPATH, '//a[@href="#/@csokinyuszi/" and @class="nav-link"]')))
    logged_in_user_name.click()
    time.sleep(3)


def find_and_clear_element(browser, element_xpath):
    web_element = WebDriverWait(browser, 5).until(EC.presence_of_element_located((By.XPATH, element_xpath)))
    web_element.clear()
    return web_element
