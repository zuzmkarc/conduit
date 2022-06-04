import time
from test_data import test_user
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait


def login(browser, email, password):
    sign_in_btn = WebDriverWait(browser, 5).until(
        EC.presence_of_element_located((By.XPATH,'//a[@href="#/login"]')))
    sign_in_btn.click()
    time.sleep(3)

    email_field = WebDriverWait(browser, 5).until(
        EC.presence_of_element_located((By.XPATH,'//input[@type="text"]')))
    email_field.clear()
    email_field.send_keys(email)

    password_field = WebDriverWait(browser, 5).until(
        EC.presence_of_element_located((By.XPATH,'//input[@type="password"]')))
    password_field.clear()
    password_field.send_keys(password)
    
    login_btn = WebDriverWait(browser, 5).until(
        EC.presence_of_element_located((By.XPATH, '//button[@class="btn btn-lg btn-primary pull-xs-right"]')))
    login_btn.click()
    time.sleep(6)


def click_logged_in_user_name(browser):
    logged_in_user_name = WebDriverWait(browser, 5).until(
        EC.presence_of_element_located((By.XPATH, '//a[@href="#/@csokinyuszi/" and @class="nav-link"]')))
    logged_in_user_name.click()
    time.sleep(3)


def find_and_clear_element(browser, element_xpath):
    web_element = WebDriverWait(browser, 5).until(EC.presence_of_element_located((By.XPATH, element_xpath)))
    web_element.clear()
    return web_element
