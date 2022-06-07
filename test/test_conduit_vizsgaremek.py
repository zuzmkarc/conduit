from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
import time
import csv
from general_functions import login, create_article, write_comment
from general_data import user, article


class TestConduit(object):
    def setup(self):
        browser_options = Options()
        browser_options.headless = True
        self.browser = webdriver.Chrome(ChromeDriverManager().install(), options=browser_options)
        self.browser.get("http://conduitapp.progmasters.hu:1667/#/")

    def teardown(self):
        self.browser.quit()

    # ATC001 - Cookie kezelési tájékoztató
    def test_accept_cookie(self):
        accept_btn = self.browser.find_element_by_xpath(
            '//button[@class="cookie__bar__buttons__button cookie__bar__buttons__button--accept"]')
        accept_btn.click()
        time.sleep(2)
        decline_btn_list = self.browser.find_elements_by_xpath(
            '//button[@class="cookie__bar__buttons__button cookie__bar__buttons__button--decline"]')
        assert not len(decline_btn_list)

    # ATC002 - Regisztráció negatív ágon (hibás email adattal)
    def test_registration(self):
        sign_up_btn = self.browser.find_element_by_xpath('//a[@href="#/register"]')
        sign_up_btn.click()
        username_input = self.browser.find_element_by_xpath('//input[@placeholder="Username"]')
        email_input = self.browser.find_element_by_xpath('//input[@placeholder="Email"]')
        password_input = self.browser.find_element_by_xpath('//input[@type="password"]')
        sign_up_send_btn = self.browser.find_element_by_xpath('//button[@class="btn btn-lg btn-primary pull-xs-right"]')
        username_input.send_keys(user["name"])
        email_input.send_keys("d")
        password_input.send_keys(user["password"])
        sign_up_send_btn.click()
        time.sleep(2)
        reg_message = self.browser.find_element_by_xpath('//div[@class="swal-title"]')
        reg_problem_reason = self.browser.find_element_by_xpath('//div[@class="swal-text"]')
        assert reg_message.text == "Registration failed!"
        assert reg_problem_reason.text == "Email must be a valid email."

    # ATC003 - Bejelentkezés pozitív ágon
    def test_login(self):
        sign_in_page_btn = self.browser.find_element_by_xpath('//a[@href="#/login"]')
        sign_in_page_btn.click()
        email_input = self.browser.find_element_by_xpath('//input[@type="text"]')
        password_input = self.browser.find_element_by_xpath('//input[@type="password"]')
        sign_in_btn = self.browser.find_element_by_xpath('//button[@class="btn btn-lg btn-primary pull-xs-right"]')
        email_input.send_keys(user["email"])
        password_input.send_keys(user["password"])
        sign_in_btn.click()
        time.sleep(2)
        user_profile = self.browser.find_elements_by_xpath('//a[@class="nav-link"]')[2]
        assert user_profile.text == user["name"]

    # ATC004 - Adatok listázása
    def test_list_elements(self):
        login(self.browser, user["email"], user["password"])
        time.sleep(1)
        lorem_tag = self.browser.find_element_by_xpath(
            '//div[@class="sidebar"]/div[@class="tag-list"]/a[text()="lorem"]')
        lorem_tag.click()
        time.sleep(2)
        article_list = self.browser.find_elements_by_xpath('//a[@class="preview-link"]/h1')
        assert len(article_list) != 0

    # ATC005 - Több oldalas lista bejárása
    def test_pagination(self):
        login(self.browser, user["email"], user["password"])
        time.sleep(1)
        page_nr_list = self.browser.find_elements_by_xpath('//a[@class="page-link"]')
        for page in page_nr_list:
            page.click()
            time.sleep(1)
            actual_page = self.browser.find_element_by_xpath('//li[@class="page-item active"]')
            assert page.text == actual_page.text

    # ATC006 - Új adat bevitel
    def test_create_new_element(self):
        login(self.browser, user["email"], user["password"])
        time.sleep(1)
        create_article(self.browser, article["title"], article["about"], article["main"], article["tags"])
        time.sleep(2)
        new_article_title = self.browser.find_element_by_xpath('//h1')
        assert new_article_title.text == article["title"]

    # ATC007 - Meglévő adat módosítás
    def test_update_element(self):
        login(self.browser, user["email"], user["password"])
        time.sleep(1)
        settings_menu = self.browser.find_element_by_xpath('//a[@href="#/settings"]')
        settings_menu.click()
        time.sleep(2)
        image_input = self.browser.find_element_by_xpath('//input[@placeholder="URL of profile picture"]')
        update_btn = self.browser.find_element_by_xpath('//button[@class="btn btn-lg btn-primary pull-xs-right"]')
        image_input.clear()
        image_input.send_keys(
            "http://thecoders.vn/wp-content/uploads/2015/09/Top-five-qualities-of-a-software-tester.jpg")
        update_btn.click()
        time.sleep(2)
        result_message = self.browser.find_element_by_xpath('//div[@class="swal-title"]')
        assert result_message.text == "Update successful!"
        confirm_btn = self.browser.find_element_by_xpath('//button[@class="swal-button swal-button--confirm"]')
        confirm_btn.click()

    # ATC008 - Adat törlése
    def test_delete_element(self):
        login(self.browser, user["email"], user["password"])
        time.sleep(2)
        user_article = self.browser.find_element_by_xpath('//a[@class="preview-link"][1]')
        user_article.click()
        time.sleep(2)
        write_comment(self.browser, "Bravo")
        comments_before = self.browser.find_elements_by_xpath('//div[@class="card"]')
        comment_pieces_before = len(comments_before)
        delete_btn = self.browser.find_element_by_xpath('//i[@class="ion-trash-a"]')
        delete_btn.click()
        time.sleep(2)
        comments_after = self.browser.find_elements_by_xpath('//div[@class="card"]')
        comment_pieces_after = len(comments_after)
        assert comment_pieces_before == comment_pieces_after + 1

    # ATC009 - Adatok lementése felületről
    def test_save_data_to_file(self):
        login(self.browser, user["email"], user["password"])
        time.sleep(1)
        tag_list = self.browser.find_elements_by_xpath('//div[@class="sidebar"]/div/a[@class="tag-pill tag-default"]')
        with open('test_conduit_vizsgaremek/tag_file.csv', 'w') as file:
            writer = csv.writer(file)
            for tag in tag_list:
                writer.writerow([tag.text])
        with open('test_conduit_vizsgaremek/tag_file.csv', 'r') as file:
            first_row = file.readline().rstrip('\n')
            assert first_row == tag_list[0].text

    # ATC010 - Ismételt és sorozatos adatbevitel adatforrásból
    def test_import_data_from_file(self):
        login(self.browser, user["email"], user["password"])
        time.sleep(1)
        with open('test_conduit_vizsgaremek/import_data.csv', 'r') as file:
            csv_reader = csv.reader(file, delimiter=';')
            for row in csv_reader:
                create_article(self.browser, row[0], row[1], row[2], row[3])
                time.sleep(2)
                new_article_title = self.browser.find_element_by_xpath('//h1')
                assert new_article_title.text == row[0]

    # ATC011 - Kijelentkezés
    def test_logout(self):
        login(self.browser, user["email"], user["password"])
        time.sleep(3)
        logout_btn = self.browser.find_element_by_xpath('//a[@active-class="active"]')
        logout_btn.click()
        time.sleep(2)
        sign_in_page_btn = self.browser.find_element_by_xpath('//a[@href="#/login"]')
        assert sign_in_page_btn.is_displayed()