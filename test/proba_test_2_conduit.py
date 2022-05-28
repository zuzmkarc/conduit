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
    # def test_registration(self):
    #     sign_up_btn = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//a[@href="#/register"]')))
    #     sign_up_btn.click()
    #
    #     username_field = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Username"]')))
    #     username_field.clear()
    #     username_field.send_keys(test_user["username_invalid"])
    #     email_field = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Email"]')))
    #     email_field.clear()
    #     email_field.send_keys(test_user["email_invalid"])
    #
    #     password_field = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Password"]')))
    #
    #     password_field.clear()
    #     password_field.send_keys(test_user["pwd_invalid"])
    #
    #     login_btn = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//button[@class="btn btn-lg btn-primary pull-xs-right"]')))
    #
    #     login_btn.click()
    #
    #     reg_failure_alert = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//div[@class="swal-title"]')))
    #
    #     invalid_email_msg = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//div[@class="swal-text"]')))
    #
    #     alert_popup = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//div[@class="swal-modal"]')))
    #     assert alert_popup.is_displayed()
    #
    #     assert invalid_email_msg.text == "Email must be a valid email."
    #     assert reg_failure_alert.text == "Registration failed!"
    #
    # # TC-02 Login with valid credentials:
    # def test_login(self):
    #     sign_in_btn = self.browser.find_element_by_xpath('//a[@href="#/login"]')
    #     sign_in_btn.click()
    #
    #     email_field = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Email"]')))
    #     email_field.clear()
    #     email_field.send_keys(test_user["email_valid"])
    #     password_field = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Password"]')))
    #
    #     password_field.clear()
    #     password_field.send_keys(test_user["pwd_valid"])
    #
    #     login_btn = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//button[@class="btn btn-lg btn-primary pull-xs-right"]')))
    #
    #     login_btn.click()
    #
    #     logged_in_user_name = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//a[@href="#/@csokinyuszi/" and @class="nav-link"]')))
    #     logout_btn = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//a[@active-class="active"]')))
    #
    #     assert logged_in_user_name.text == "csokinyuszi"
    #     assert logout_btn.is_displayed()
    #
    # # TC-03 Logout user
    # def test_logout(self):
    #     sign_in_btn = self.browser.find_element_by_xpath('//a[@href="#/login"]')
    #     sign_in_btn.click()
    #
    #     email_field = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Email"]')))
    #     email_field.clear()
    #     email_field.send_keys(test_user["email_valid"])
    #     password_field = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Password"]')))
    #
    #     password_field.clear()
    #     password_field.send_keys(test_user["pwd_valid"])
    #
    #     login_btn = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//button[@class="btn btn-lg btn-primary pull-xs-right"]')))
    #
    #     login_btn.click()
    #
    #     logout_btn = WebDriverWait(self.browser, 2).until(EC.presence_of_element_located((By.XPATH, '//a[@active-class="active"]')))
    #
    #     logout_btn.click()
    #
    #     sign_in_btn = self.browser.find_element_by_xpath('//a[@href="#/login"]')
    #     assert sign_in_btn.is_displayed()

    # TC-04 Accept cookies
    # def test_accept_cookie(self):
    #
    #     cookie_bar = WebDriverWait(self.browser, 2).until(EC.presence_of_element_located((By.XPATH, '//div[@class = "cookie__bar__buttons"]')))
    #     assert cookie_bar.is_displayed()
    #
    #     div_list_init_page = WebDriverWait(self.browser, 2).until(EC.presence_of_all_elements_located((By.XPATH, '//div[@class]')))
    #     div_list_init_page_length = len(div_list_init_page)
    #
    #     cookie_btn_accept = WebDriverWait(self.browser, 2).until(EC.presence_of_element_located((By.XPATH, '//button[@class ="cookie__bar__buttons__button cookie__bar__buttons__button--accept"]')))
    #     cookie_btn_accept.click()
    #
    #     time.sleep(2)
    #
    #     div_list_after_cookie_accept = WebDriverWait(self.browser, 2).until(EC.presence_of_all_elements_located((By.XPATH, '//div[@class]')))
    #     div_list_after_cookie_accept_length = len(div_list_after_cookie_accept)
    #
    #     assert div_list_init_page_length - 4 == div_list_after_cookie_accept_length

    # TC-05 Create new element
    # def test_create_new_element(self):
    #     # sign_in()
    #     sign_in_btn = self.browser.find_element_by_xpath('//a[@href="#/login"]')
    #     sign_in_btn.click()
    #
    #     email_field = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Email"]')))
    #     email_field.clear()
    #     email_field.send_keys(test_user["email_valid"])
    #     password_field = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Password"]')))
    #
    #     password_field.clear()
    #     password_field.send_keys(test_user["pwd_valid"])
    #
    #     login_btn = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//button[@class="btn btn-lg btn-primary pull-xs-right"]')))
    #
    #     login_btn.click()
    #
    #     new_article_btn = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//a[@href="#/editor"]')))
    #     new_article_btn.click()
    #     #time.sleep(3)
    #
    #     new_article_title = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Article Title"]')))
    #     new_article_about = self.browser.find_element_by_xpath('''//input[@placeholder="What's this article about?"]''')
    #     new_article_text = self.browser.find_element_by_xpath(
    #         '//textarea[@placeholder="Write your article (in markdown)"]')
    #     new_article_tag = self.browser.find_element_by_xpath('//input[@placeholder="Enter tags"]')
    #
    #     new_article_title.send_keys(test_user["article_title"])
    #     new_article_about.send_keys(test_user["article_about"])
    #     new_article_text.send_keys(test_user["article_text"])
    #     new_article_tag.send_keys(test_user["article_tag"])
    #
    #     time.sleep(3)
    #
    #     publish_btn = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//button[@type="submit"]')))
    #     publish_btn.click()
    #
    #     time.sleep(3)
    #
    #     logged_in_user_name = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH, '//a[@href="#/@csokinyuszi/" and @class="nav-link"]')))
    #     logged_in_user_name.click()
    #
    #     time.sleep(3)
    #
    #     published_article = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_all_elements_located((By.XPATH, '//a[@href="#/articles/szap"]')[0]))
    #
    #     assert published_article.is_displayed()
    #
    #     published_article.click()
    #     time.sleep(3)
    #
    #     published_article_text = WebDriverWait(self.browser, 2).until(
    #         EC.presence_of_element_located((By.XPATH,'//div/p')))
    #
    #     assert published_article_text.text == test_user["article_text"]
    #
    #     trash_btn = self.browser.find_elements_by_xpath('//i[@class="ion-trash-a"]')
    #     trash_btn[0].click()

# TC-06 Delete element
# def test_delete_element(self):
#     sign_in_btn = self.browser.find_element_by_xpath('//a[@href="#/login"]')
#     sign_in_btn.click()
#     time.sleep(3)
#     email_field = self.browser.find_element_by_xpath('//input[@placeholder="Email"]')
#     # email_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Email"]')))
#     email_field.clear()
#     email_field.send_keys(test_user["email_valid"])
#     # password_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH,'//input[@placeholder="Password"]')))
#     password_field = self.browser.find_element_by_xpath('//input[@placeholder="Password"]')
#     password_field.clear()
#     password_field.send_keys(test_user["pwd_valid"])
#     login_btn = self.browser.find_element_by_xpath('//button[@class="btn btn-lg btn-primary pull-xs-right"]')
#     login_btn.click()
#     time.sleep(3)
#
#     new_article_btn = self.browser.find_element_by_xpath('//a[@href="#/editor"]')
#     new_article_btn.click()
#     time.sleep(3)
#     new_article_title = self.browser.find_element_by_xpath('//input[@placeholder="Article Title"]')
#     new_article_about = self.browser.find_element_by_xpath(
#         '''//input[@placeholder="What's this article about?"]''')
#     new_article_text = self.browser.find_element_by_xpath(
#         '//textarea[@placeholder="Write your article (in markdown)"]')
#     new_article_tag = self.browser.find_element_by_xpath('//input[@placeholder="Enter tags"]')
#     publish_btn = self.browser.find_element_by_xpath('//button[@type="submit"]')
#
#     new_article_title.send_keys(test_user["article_title"])
#     new_article_about.send_keys(test_user["article_about"])
#     new_article_text.send_keys(test_user["article_text"])
#     new_article_tag.send_keys(test_user["article_tag"])
#
#     publish_btn.click()
#     time.sleep(5)
#
#     logged_in_user_name = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH,'//a[@href="#/@csokinyuszi/" and @class="nav-link"]')))
#     logged_in_user_name.click()
#     time.sleep(3)
#     #published_article = self.browser.find_element_by_xpath('//div[@class="col-xs-12"]')
#     #published_article.click()
#     #time.sleep(3)
#
#     articles_list = self.browser.find_elements_by_xpath('//div[@class="article-preview"]')
#
#     published_article = self.browser.find_element_by_xpath('//a[@href="#/articles/szap"]')
#     published_article.click()
#     time.sleep(3)
#
#     delete_article_btn = self.browser.find_element_by_xpath('//button[@class ="btn btn-outline-danger btn-sm"]')
#     delete_article_btn.click()
#     time.sleep(3)
#
#     logged_in_user_name = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//a[@href="#/@csokinyuszi/" and @class="nav-link"]')))
#     logged_in_user_name.click()
#     time.sleep(3)
#
#     articles_list_modified = self.browser.find_elements_by_xpath('//div[@class="article-preview"]')
#
#     assert not len(articles_list) == len(articles_list_modified)
#
#     #assert not published_article.is_displayed()
#     #????? stale element reference exception

# TC-07 Import data from file
#     def test_import_data_from_file(self):
#         sign_in_btn = self.browser.find_element_by_xpath('//a[@href="#/login"]')
#         sign_in_btn.click()
#
#         email_field = WebDriverWait(self.browser, 2).until(
#                 EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Email"]')))
#         email_field.clear()
#         email_field.send_keys(test_user["email_valid"])
#         password_field = WebDriverWait(self.browser, 2).until(
#                 EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Password"]')))
#
#         password_field.clear()
#         password_field.send_keys(test_user["pwd_valid"])
#
#         login_btn = WebDriverWait(self.browser, 2).until(
#                 EC.presence_of_element_located((By.XPATH, '//button[@class="btn btn-lg btn-primary pull-xs-right"]')))
#
#         login_btn.click()
#
#         logged_in_user_name = WebDriverWait(self.browser, 5).until(
#             EC.presence_of_element_located((By.XPATH, '//a[@href="#/@csokinyuszi/" and @class="nav-link"]')))
#         logged_in_user_name.click()
#
#
#         article_to_comment = WebDriverWait(self.browser, 5).until(
#             EC.presence_of_element_located((By.XPATH, '//a[@href="#/articles/zz" and @class="preview-link"]')))
#         article_to_comment.click()
#         time.sleep(3)
#
#         comment_field = WebDriverWait(self.browser, 5).until(EC.presence_of_element_located((By.XPATH, '//textarea[@placeholder="Write a comment..."]')))
#         comment_field.clear()
#         with open('comments_data.txt', 'r', encoding='UTF-8') as f:
#             file_content = f.readline()
#             file_content_lines = []
#             while file_content:
#                 comment_field.clear()
#                 comment_field.send_keys(file_content)
#                 post_comment_btn = self.browser.find_element_by_xpath('//button[@class="btn btn-sm btn-primary"]')
#                 post_comment_btn.click()
#                 file_content_lines.append(file_content)
#                 file_content = f.readline()
#
#         comment_list_after = WebDriverWait(self.browser, 5).until(
#             EC.presence_of_all_elements_located((By.XPATH, '//p[@class="card-text"]')))
#
#         assert len(file_content_lines) == len(comment_list_after)
#
#         trash_btn = WebDriverWait(self.browser, 5).until(
#             EC.presence_of_all_elements_located((By.XPATH, '//i[@class="ion-trash-a"]')))
#         for i in range(1, (len(comment_list_after)) - 1):
#             trash_btn[i].click()

    #TC-08 Update element (profile picture)
    # def test_update_profile_picture(self):
    #     sign_in_btn = self.browser.find_element_by_xpath('//a[@href="#/login"]')
    #     sign_in_btn.click()
    #
    #     email_field = WebDriverWait(self.browser, 2).until(
    #             EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Email"]')))
    #     email_field.clear()
    #     email_field.send_keys(test_user["email_valid"])
    #     password_field = WebDriverWait(self.browser, 2).until(
    #             EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Password"]')))
    #
    #     password_field.clear()
    #     password_field.send_keys(test_user["pwd_valid"])
    #
    #     login_btn = WebDriverWait(self.browser, 2).until(
    #             EC.presence_of_element_located((By.XPATH, '//button[@class="btn btn-lg btn-primary pull-xs-right"]')))
    #
    #     login_btn.click()
    #
    #     settings = WebDriverWait(self.browser, 2).until(
    #             EC.presence_of_element_located((By.XPATH, '//a[@href = "#/settings"]')))
    #     settings.click()
    #
    #     profile_pic_field = WebDriverWait(self.browser, 2).until(
    #             EC.presence_of_element_located((By.XPATH, '//input[@placeholder="URL of profile picture"]')))
    #     profile_pic_field.clear()
    #     #profile_pic_field.send_keys(test_user["profile-pic"])
    #     profile_pic_field.send_keys("https://news.cgtn.com/news/7a596a4e30677a4e7963444d7745444f786b444f31457a6333566d54/img/4a95e146fb534365b0ad037bc1e7a9d5/4a95e146fb534365b0ad037bc1e7a9d5.jpg")
    #
    #     update_btn = WebDriverWait(self.browser, 2).until(
    #             EC.presence_of_element_located((By.XPATH, '//button[@class="btn btn-lg btn-primary pull-xs-right"]')))
    #     update_btn.click()
    #
    #     confirm_btn = WebDriverWait(self.browser, 2).until(EC.presence_of_element_located((By.XPATH, '//button[@class="swal-button swal-button--confirm"]')))
    #     confirm_btn.click()
    #
    #     logged_in_user_name = WebDriverWait(self.browser, 5).until(
    #         EC.presence_of_element_located((By.XPATH, '//a[@href="#/@csokinyuszi/" and @class="nav-link"]')))
    #     logged_in_user_name.click()
    #
    #     profile_pic = WebDriverWait(self.browser, 5).until(
    #         EC.presence_of_element_located((By.XPATH, '//img[@class="user-img"]')))
    #
    #     #assert profile_pic.get_attribute("src") == test_user["profile_pic"]
    #     assert profile_pic.get_attribute("src") == "https://news.cgtn.com/news/7a596a4e30677a4e7963444d7745444f786b444f31457a6333566d54/img/4a95e146fb534365b0ad037bc1e7a9d5/4a95e146fb534365b0ad037bc1e7a9d5.jpg"



