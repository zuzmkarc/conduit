from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
import time
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait


class TestConduit(object):

    def setup(self):
        self.browser = webdriver.Chrome(ChromeDriverManager().install())
        URL = "http://localhost:1667/#/"
        self.browser.get(URL)

    def teardown(self):
        self.browser.quit()

    # TC-01 Registration with invalid email
    def test_registration(self):
        #sign_up_btn = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH,'//a[@href="#/register"]')))
        sign_up_btn = self.browser.find_element_by_xpath('//a[@href="#/register"]')
        sign_up_btn.click()
        time.sleep(5)
        # username_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH,'//input[@placeholder="Username"]')))
        username_field = self.browser.find_element_by_xpath('//input[@placeholder="Username"]')
        username_field.clear()
        username_field.send_keys("testuser")
        # email_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Email"]')))
        email_field = self.browser.find_element_by_xpath('//input[@placeholder="Email"]')
        email_field.clear()
        email_field.send_keys("test@gmail")
        # password_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Password"]')))
        password_field = self.browser.find_element_by_xpath('//input[@placeholder="Password"]')
        password_field.clear()
        password_field.send_keys("Test2022")
        # login_btn = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//button[@class="btn btn-lg btn-primary pull-xs-right"]')))
        login_btn = self.browser.find_element_by_xpath('//button[@class="btn btn-lg btn-primary pull-xs-right"]')
        login_btn.click()
        time.sleep(5)
        # reg_failure_alert = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//div[@class="swal-title"]')))
        reg_failure_alert = self.browser.find_element_by_xpath('//div[@class="swal-title"]')
        # invalid_email_msg = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//div[@class="swal-text"]')))
        invalid_email_msg = self.browser.find_element_by_xpath('//div[@class="swal-text"]')
        # alert_popup = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//div[@class="swal-modal"]')))
        #assert alert_popup.is_displayed()
        time.sleep(5)
        assert invalid_email_msg.text == "Email must be a valid email."
        assert reg_failure_alert.text == "Registration failed!"

    # TC-02 Login with valid credentials:
    def test_login(self):
        sign_in_btn = self.browser.find_element_by_xpath('//a[@href="#/login"]')
        sign_in_btn.click()
        time.sleep(5)
        email_field = self.browser.find_element_by_xpath('//input[@placeholder="Email"]')
        #email_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Email"]')))
        email_field.clear()
        email_field.send_keys("csokinyuszi2022@gmail.com")
        #password_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH,'//input[@placeholder="Password"]')))
        password_field = self.browser.find_element_by_xpath('//input[@placeholder="Password"]')
        password_field.clear()
        password_field.send_keys("Nyuszi22")
        login_btn = self.browser.find_element_by_xpath('//button[@class="btn btn-lg btn-primary pull-xs-right"]')
        login_btn.click()
        time.sleep(5)
        #logged_in_user_name = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH,'//a[@href="#/@csokinyuszi/"]')[0]))
        logged_in_user_name = self.browser.find_elements_by_xpath('//a[@href="#/@csokinyuszi/"]')[0]
        #logout_btn = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH,'//a[@active-class="active"]')))
        logout_btn = self.browser.find_element_by_xpath('//a[@active-class="active"]')
        assert logged_in_user_name.text == "csokinyuszi"
        assert logout_btn.is_displayed()

    # TC-03 Logout user
    def test_logout(self):
        sign_in_btn = self.browser.find_element_by_xpath('//a[@href="#/login"]')
        sign_in_btn.click()
        time.sleep(5)
        email_field = self.browser.find_element_by_xpath('//input[@placeholder="Email"]')
        # email_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Email"]')))
        email_field.clear()
        email_field.send_keys("csokinyuszi2022@gmail.com")
        # password_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH,'//input[@placeholder="Password"]')))
        password_field = self.browser.find_element_by_xpath('//input[@placeholder="Password"]')
        password_field.clear()
        password_field.send_keys("Nyuszi22")
        login_btn = self.browser.find_element_by_xpath('//button[@class="btn btn-lg btn-primary pull-xs-right"]')
        login_btn.click()
        time.sleep(5)
        logout_btn = self.browser.find_element_by_xpath('//a[@active-class="active"]')
        logged_in_user_name = self.browser.find_elements_by_xpath('//a[@href="#/@csokinyuszi/"]')[0]
        logout_btn.click()
        time.sleep(5)
        sign_in_btn = self.browser.find_element_by_xpath('//a[@href="#/login"]')
        assert sign_in_btn.is_displayed()

