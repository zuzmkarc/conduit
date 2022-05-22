from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
import time
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait
from test_data import test_user


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
        time.sleep(3)
        # username_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH,'//input[@placeholder="Username"]')))
        username_field = self.browser.find_element_by_xpath('//input[@placeholder="Username"]')
        username_field.clear()
        username_field.send_keys(test_user["username_invalid"])
        # email_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Email"]')))
        email_field = self.browser.find_element_by_xpath('//input[@placeholder="Email"]')
        email_field.clear()
        email_field.send_keys(test_user["email_invalid"])
        # password_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Password"]')))
        password_field = self.browser.find_element_by_xpath('//input[@placeholder="Password"]')
        password_field.clear()
        password_field.send_keys(test_user["pwd_invalid"])
        # login_btn = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//button[@class="btn btn-lg btn-primary pull-xs-right"]')))
        login_btn = self.browser.find_element_by_xpath('//button[@class="btn btn-lg btn-primary pull-xs-right"]')
        login_btn.click()
        time.sleep(3)
        # reg_failure_alert = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//div[@class="swal-title"]')))
        reg_failure_alert = self.browser.find_element_by_xpath('//div[@class="swal-title"]')
        # invalid_email_msg = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//div[@class="swal-text"]')))
        invalid_email_msg = self.browser.find_element_by_xpath('//div[@class="swal-text"]')
        # alert_popup = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//div[@class="swal-modal"]')))
        #assert alert_popup.is_displayed()
        time.sleep(3)
        assert invalid_email_msg.text == "Email must be a valid email."
        assert reg_failure_alert.text == "Registration failed!"

    # TC-02 Login with valid credentials:
    def test_login(self):
        sign_in_btn = self.browser.find_element_by_xpath('//a[@href="#/login"]')
        sign_in_btn.click()
        time.sleep(3)
        email_field = self.browser.find_element_by_xpath('//input[@placeholder="Email"]')
        #email_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Email"]')))
        email_field.clear()
        email_field.send_keys(test_user["email_valid"])
        #password_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH,'//input[@placeholder="Password"]')))
        password_field = self.browser.find_element_by_xpath('//input[@placeholder="Password"]')
        password_field.clear()
        password_field.send_keys(test_user["pwd_valid"])
        login_btn = self.browser.find_element_by_xpath('//button[@class="btn btn-lg btn-primary pull-xs-right"]')
        login_btn.click()
        time.sleep(3)
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
        time.sleep(3)
        email_field = self.browser.find_element_by_xpath('//input[@placeholder="Email"]')
        # email_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Email"]')))
        email_field.clear()
        email_field.send_keys(test_user["email_valid"])
        # password_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH,'//input[@placeholder="Password"]')))
        password_field = self.browser.find_element_by_xpath('//input[@placeholder="Password"]')
        password_field.clear()
        password_field.send_keys(test_user["pwd_valid"])
        login_btn = self.browser.find_element_by_xpath('//button[@class="btn btn-lg btn-primary pull-xs-right"]')
        login_btn.click()
        time.sleep(3)
        logout_btn = self.browser.find_element_by_xpath('//a[@active-class="active"]')
        logged_in_user_name = self.browser.find_elements_by_xpath('//a[@href="#/@csokinyuszi/"]')[0]
        logout_btn.click()
        time.sleep(3)
        sign_in_btn = self.browser.find_element_by_xpath('//a[@href="#/login"]')
        assert sign_in_btn.is_displayed()

    # TC-04 Accept cookies
    def test_accept_cookie(self):
        cookie_btn_accept = self.browser.find_element_by_xpath('//button[@class ="cookie__bar__buttons__button cookie__bar__buttons__button--accept"]')
        cookie_bar = self.browser.find_element_by_xpath('//div[@class = "cookie__bar__buttons"]')
        assert cookie_bar.is_displayed()
        cookie_btn_accept.click()
        #assert not cookie_bar.is_displayed() ????? stale element reference exception

    # TC-05 Create new element
    def test_create_new_element(self):
        sign_in_btn = self.browser.find_element_by_xpath('//a[@href="#/login"]')
        sign_in_btn.click()
        time.sleep(3)
        email_field = self.browser.find_element_by_xpath('//input[@placeholder="Email"]')
        # email_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Email"]')))
        email_field.clear()
        email_field.send_keys(test_user["email_valid"])
        # password_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH,'//input[@placeholder="Password"]')))
        password_field = self.browser.find_element_by_xpath('//input[@placeholder="Password"]')
        password_field.clear()
        password_field.send_keys(test_user["pwd_valid"])
        login_btn = self.browser.find_element_by_xpath('//button[@class="btn btn-lg btn-primary pull-xs-right"]')
        login_btn.click()
        time.sleep(3)

        new_article_btn = self.browser.find_element_by_xpath('//a[@href="#/editor"]')
        new_article_btn.click()
        time.sleep(3)
        new_article_title = self.browser.find_element_by_xpath('//input[@placeholder="Article Title"]')
        new_article_about = self.browser.find_element_by_xpath('''//input[@placeholder="What's this article about?"]''')
        new_article_text = self.browser.find_element_by_xpath('//textarea[@placeholder="Write your article (in markdown)"]')
        new_article_tag = self.browser.find_element_by_xpath('//input[@placeholder="Enter tags"]')
        publish_btn = self.browser.find_element_by_xpath('//button[@type="submit"]')

        new_article_title.send_keys(test_user["article_title"])
        new_article_about.send_keys(test_user["article_about"])
        new_article_text.send_keys(test_user["article_text"])
        new_article_tag.send_keys(test_user["article_tag"])

        publish_btn.click()
        time.sleep(3)

        logged_in_user_name = self.browser.find_elements_by_xpath('//a[@href="#/@csokinyuszi/"]')[0]
        logged_in_user_name.click()
        #home_btn = self.browser.find_elements_by_xpath('//a[@class="nav-link"]')[0]
        #home_btn.click()
        time.sleep(3)

        published_article = self.browser.find_element_by_xpath('//a[@href="#/articles/szap"]')
        #published_article_about = self.browser.find_element_by_xpath('//p[text()="őszapó éneke"]')
        #assert published_article_title.text == test_user["article_title"]
        #assert published_article_about.text == test_user["article_about"]
        assert published_article.is_displayed()
        read_more_btn = self.browser.find_elements_by_xpath('//a[@href="#/articles/szap"]/span')[1]
        read_more_btn.click()
        time.sleep(3)
        published_article_text = self.browser.find_element_by_xpath('//div/p')
        assert published_article_text.text == test_user["article_text"]





