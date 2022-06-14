from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
import time
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait
from test_data import test_user, test_article, messages
import csv
from selenium.webdriver.chrome.options import Options
from functions import registration, login, click_logged_in_user_name, find_and_clear_element


class TestConduit(object):

    def setup(self):
        browser_options = Options()
        browser_options.headless = True
        self.browser = webdriver.Chrome(ChromeDriverManager().install(), options=browser_options)
        self.browser.implicitly_wait(10)
        URL = "http://localhost:1667/#/"
        self.browser.get(URL)

    def teardown(self):
        self.browser.quit()

    #
    # # TC-01 Accept cookies - Adatkezelési nyilatkozat használata: sütik elfogadásának ellenőrzése
    # def test_accept_cookie(self):
    #     cookie_bar = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//div[@class = "cookie__bar__buttons"]')))
    #     assert cookie_bar.is_displayed()
    #
    #     accept_btn_list_before_click = self.browser.find_elements_by_xpath(
    #         '//button[@class ="cookie__bar__buttons__button cookie__bar__buttons__button--accept"]')
    #     print(len(accept_btn_list_before_click))
    #
    #     cookie_btn_accept = WebDriverWait(self.browser, 6).until(EC.presence_of_element_located(
    #         (By.XPATH, '//button[@class ="cookie__bar__buttons__button cookie__bar__buttons__button--accept"]')))
    #     cookie_btn_accept.click()
    #
    #     time.sleep(4)
    #
    #     accept_btn_list_after_click = self.browser.find_elements_by_xpath(
    #         '//button[@class ="cookie__bar__buttons__button cookie__bar__buttons__button--accept"]')
    #
    #     print(len(accept_btn_list_after_click))
    #
    #     assert not len(accept_btn_list_after_click)
    #
    # # TC-02 Registration with invalid email - Regisztrációs folyamat tesztelése negatív ágon helytelen email cím megadásával
    # def test_registration(self):
    #     sign_up_btn = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//a[@href="#/register"]')))
    #     sign_up_btn.click()
    #
    #     username_field = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Username"]')))
    #     username_field.clear()
    #     username_field.send_keys(test_user["username_invalid"])
    #     email_field = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Email"]')))
    #     email_field.clear()
    #     email_field.send_keys(test_user["email_invalid"])
    #
    #     password_field = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Password"]')))
    #
    #     password_field.clear()
    #     password_field.send_keys(test_user["pwd_invalid"])
    #
    #     login_btn = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//button[@class="btn btn-lg btn-primary pull-xs-right"]')))
    #
    #     login_btn.click()
    #
    #     reg_failure_alert = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//div[@class="swal-title"]')))
    #
    #     invalid_email_msg = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//div[@class="swal-text"]')))
    #
    #     alert_popup = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//div[@class="swal-modal"]')))
    #     assert alert_popup.is_displayed()
    #
    #     assert invalid_email_msg.text == messages["invalid_email_msg"]
    #     assert reg_failure_alert.text == messages["reg_failure_alert"]
    #
    # # TC-03 Login with valid credentials - Bejelentkezési folyamat tesztelése pozitív ágon
    # def test_login(self):
    #     registration(self.browser, (test_user["username_valid"]), (test_user["email_valid"]), (test_user["pwd_valid"]))
    #     login(self.browser, (test_user["email_valid"]), (test_user["pwd_valid"]))
    #     time.sleep(5)
    #
    #     logged_in_user_name = self.browser.find_element_by_xpath('//a[@class="nav-link" and @href="#/@Teszt/"]')
    #     logout_btn = self.browser.find_element_by_xpath('//a[@active-class="active"]')
    #
    #     assert logged_in_user_name.text == test_user["username_valid"]
    #     assert logout_btn.is_displayed()
    #
    # # TC-04 Logout user - Kijelentkezési folyamat tesztelése
    # def test_logout(self):
    #
    #     login(self.browser, (test_user["email_valid"]), (test_user["pwd_valid"]))
    #
    #     logout_btn = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//a[@active-class="active"]')))
    #
    #     logout_btn.click()
    #     time.sleep(5)
    #
    #     sign_in_btn = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//a[@href="#/login"]')))
    #     assert sign_in_btn.is_displayed()
    #
    # # TC-05 Save data to file - Adatok lementése felületről: egy felhasználó által létrehozott cikkek címeinek kiírása .txt file-ba
    # def test_save_data_to_file(self):
    #     login(self.browser, (test_user["email_valid"]), (test_user["pwd_valid"]))
    #
    #     author = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_all_elements_located((By.XPATH, '//a[@class="author" and  @href = "#/@testuser1/"]')))
    #     author[0].click()
    #     time.sleep(6)
    #
    #     author_articles_titles = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_all_elements_located((By.XPATH, '//a[@class="preview-link"]//h1')))
    #
    #     with open("result.txt", "w", encoding='UTF-8') as result_content_empty:
    #         for title in author_articles_titles:
    #             result_content_empty.write(title.text)
    #             result_content_empty.write('\n')
    #
    #     with open("result.txt", "r", encoding='UTF-8') as result_content_filled:
    #         check_content = result_content_filled.readlines()
    #
    #     assert len(check_content) == len(author_articles_titles)
    #
    # # TC-06 Import data from csv file - Ismételt és sorozatos adatbevitel adatforrásból: 4 új cikk létrehozása csv file-ból importált adatokkal
    # def test_import_data_from_file(self):
    #     login(self.browser, (test_user["email_valid"]), (test_user["pwd_valid"]))
    #     time.sleep(6)
    #
    #     articles_before = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_all_elements_located((By.XPATH, '//a[@class="preview-link"] ')))
    #
    #     all_articles_counter = len(articles_before)
    #     my_articles_counter = 0
    #
    #     new_article_btn = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//a[@href="#/editor"]')))
    #     new_article_btn.click()
    #     time.sleep(6)
    #
    #     new_article_title_xpath = '//input[@placeholder="Article Title"]'
    #     new_article_about_xpath = '''//input[@placeholder="What's this article about?"]'''
    #     new_article_text_xpath = '//textarea[@placeholder="Write your article (in markdown)"]'
    #     new_article_tag_xpath = '//input[@placeholder="Enter tags"]'
    #
    #     with open("test/articles.csv", "r") as csvfile:
    #         csvreader = csv.reader(csvfile, delimiter=";")
    #         next(csvreader)
    #         for row in csvreader:
    #             find_and_clear_element(self.browser, new_article_title_xpath).send_keys(row[0])
    #             find_and_clear_element(self.browser, new_article_about_xpath).send_keys(row[1])
    #             find_and_clear_element(self.browser, new_article_text_xpath).send_keys(row[2])
    #             find_and_clear_element(self.browser, new_article_tag_xpath).send_keys(row[3])
    #             publish_btn = WebDriverWait(self.browser, 6).until(
    #                 EC.presence_of_element_located((By.XPATH, '//button[@type="submit"]')))
    #             publish_btn.click()
    #             time.sleep(2)
    #             all_articles_counter += 1
    #             my_articles_counter += 1
    #             new_article_btn.click()
    #             time.sleep(2)
    #
    #     home_btn = self.browser.find_element_by_xpath('//a[@href="#/" and @class="nav-link"]')
    #     home_btn.click()
    #     time.sleep(6)
    #
    #     assert all_articles_counter - my_articles_counter == len(articles_before)
    #
    # # TC-07 Create new element - Új adat bevitel: megjegyzés hozzáadása egy cikkhez
    # def test_create_new_element(self):
    #     login(self.browser, (test_user["email_valid"]), (test_user["pwd_valid"]))
    #     click_logged_in_user_name(self.browser)
    #     time.sleep(6)
    #     my_articles = self.browser.find_elements_by_xpath('//a[@class="preview-link"]')
    #     article_to_comment = my_articles[0]
    #     article_to_comment.click()
    #     time.sleep(6)
    #
    #     comment_field_xpath = '//textarea[@placeholder="Write a comment..."]'
    #     find_and_clear_element(self.browser, comment_field_xpath).send_keys(test_article["comment"])
    #
    #     post_comment_btn = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//button[@class="btn btn-sm btn-primary"]')))
    #     post_comment_btn.click()
    #     time.sleep(6)
    #
    #     posted_comments = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_all_elements_located((By.XPATH, '//p[@class="card-text"]')))
    #     my_comment = posted_comments[0]
    #
    #     assert my_comment.text == test_article["comment"]
    #
    # # TC-08 Delete element  - Adat vagy adatok törlése: egy cikkhez hozzáadott megjegyzés eltávolítása
    # def test_delete_element(self):
    #     login(self.browser, (test_user["email_valid"]), (test_user["pwd_valid"]))
    #     all_articles = self.browser.find_elements_by_xpath('//a[@class="preview-link"]')
    #     article_to_comment = all_articles[0]
    #     article_to_comment.click()
    #
    #     time.sleep(3)
    #
    #     comment_field_xpath = '//textarea[@placeholder="Write a comment..."]'
    #     find_and_clear_element(self.browser, comment_field_xpath).send_keys(test_article["comment"])
    #
    #     post_comment_btn = WebDriverWait(self.browser, 3).until(
    #         EC.presence_of_element_located((By.XPATH, '//button[@class="btn btn-sm btn-primary"]')))
    #     post_comment_btn.click()
    #
    #     time.sleep(2)
    #
    #     comment_list_before_del = WebDriverWait(self.browser, 3).until(
    #         EC.presence_of_all_elements_located((By.XPATH, '//p[@class="card-text"]')))
    #
    #     delete_btn = self.browser.find_elements_by_xpath('//i[@class="ion-trash-a"]')[0]
    #     delete_btn.click()
    #
    #     time.sleep(2)
    #
    #     comment_list_after_del = self.browser.find_elements_by_xpath('//p[@class="card-text"]')
    #
    #     assert len(comment_list_before_del) == len(comment_list_after_del) + 1
    #
    # # TC-09 Update element - Meglévő adat módosítás: profilkép cseréje
    # def test_update_profile_picture(self):
    #     login(self.browser, (test_user["email_valid"]), (test_user["pwd_valid"]))
    #
    #     settings = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//a[@href = "#/settings"]')))
    #     settings.click()
    #     time.sleep(6)
    #
    #     profile_pic_field_xpath = '//input[@placeholder="URL of profile picture"]'
    #     find_and_clear_element(self.browser, profile_pic_field_xpath).send_keys(test_user["profile-pic"])
    #
    #     update_btn = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//button[@class="btn btn-lg btn-primary pull-xs-right"]')))
    #     update_btn.click()
    #
    #     confirm_btn = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//button[@class="swal-button swal-button--confirm"]')))
    #     confirm_btn.click()
    #     time.sleep(6)
    #
    #     click_logged_in_user_name(self.browser)
    #     time.sleep(6)
    #
    #     profile_pic = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//img[@class="user-img"]')))
    #
    #     assert profile_pic.get_attribute("src") == (test_user["profile-pic"])
    #
    # # TC-10 List elements - Adatok listázása: egy kulcsszóhoz tartozó összes cikk megjelenítése
    # def test_list_elements(self):
    #     login(self.browser, (test_user["email_valid"]), (test_user["pwd_valid"]))
    #
    #     ipsum_tagged_articles_main = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_all_elements_located(
    #             (By.XPATH, '//a[@href="#/tag/ipsum" and @class="tag-pill tag-default"]')))
    #
    #     ipsum_tag = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//a[@href = "#/tag/ipsum"]')))
    #     ipsum_tag.click()
    #     time.sleep(6)
    #
    #     ipsum_tag_articles_filtered = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_all_elements_located((By.XPATH, '//a[@href="#/tag/ipsum" and @class="router-link-exact-active router-link-active tag-pill tag-default"]')))
    #
    #     ipsum_tag_filter = WebDriverWait(self.browser, 6).until(
    #         EC.presence_of_element_located((By.XPATH, '//a[@class="nav-link router-link-exact-active active"]')))
    #
    #     assert ipsum_tag_filter.is_displayed()
    #     assert len(ipsum_tagged_articles_main) == len(ipsum_tag_articles_filtered)

    # TC-11 Pagination - Több oldalas lista bejárása: lapozás az oldalon
    def test_pagination(self):
        login(self.browser, (test_user["email_valid"]), (test_user["pwd_valid"]))
        time.sleep(6)

        pagination_buttons = WebDriverWait(self.browser, 6).until(
            EC.presence_of_all_elements_located((By.XPATH, '//li/a[@class="page-link"]')))

        active_page_button_color_value = "rgba(255, 255, 255, 1)"
        inactive_page_button_color_value = "rgba(92, 184, 92, 1)"

        first_page_button = pagination_buttons[0]
        assert first_page_button.value_of_css_property('color') == active_page_button_color_value

        for page in pagination_buttons:
            page.click()
            time.sleep(1)
            assert page.value_of_css_property('color') == active_page_button_color_value

        time.sleep(3)

        assert first_page_button.value_of_css_property('color') == inactive_page_button_color_value
