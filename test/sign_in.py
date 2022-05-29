from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
import time
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait
from test_data import test_user

browser = webdriver.Chrome(ChromeDriverManager().install())
URL = "http://localhost:1667/#/"
browser.get(URL)

sign_in_btn = browser.find_element_by_xpath('//a[@href="#/login"]')
sign_in_btn.click()
# time.sleep(3)
# mail_field = browser.find_element_by_xpath('//input[@placeholder="Email"]')
email_field = WebDriverWait(browser, 5).until(
    EC.presence_of_element_located((By.XPATH, '//input[@placeholder="Email"]')))
email_field.clear()
email_field.send_keys(test_user["email_valid"])
# password_field = WebDriverWait(browser, 5).until(EC.presence_of_element_located((By.XPATH,'//input[@placeholder="Password"]')))
password_field = browser.find_element_by_xpath('//input[@placeholder="Password"]')
password_field.clear()
password_field.send_keys(test_user["pwd_valid"])
login_btn = browser.find_element_by_xpath('//button[@class="btn btn-lg btn-primary pull-xs-right"]')
login_btn.click()

time.sleep(3)

#page_one_btn = WebDriverWait(self.browser, 2).until(EC.presence_of_all_elements_located((By.XPATH, '//li/a[@class="page-link"]')[0]))

pagination_buttons = browser.find_elements_by_xpath('//li/a[@class="page-link"]')
# pagination_button1_is_active = browser.find_elements_by_xpath('//li/a[@class="page-link"]//..')[0]
# pagination_button2_is_active = browser.find_elements_by_xpath('//li/a[@class="page-link"]//..')[1]
# print(pagination_button1_is_active.get_attribute("class"))
# print(pagination_button2_is_active.get_attribute("class"))
active_button_color_value = "rgba(255, 255, 255, 1)"
inactive_button_color_value = "rgba(92, 184, 92, 1)"

page_one_btn = pagination_buttons[0]
page_two_btn = pagination_buttons[1]

page_one_btn.click()
time.sleep(2)


print(page_one_btn.value_of_css_property('color'))
print(page_two_btn.value_of_css_property('color'))

assert page_one_btn.value_of_css_property('color') == active_button_color_value
assert page_two_btn.value_of_css_property('color') == inactive_button_color_value


# print(page_one_btn.value_of_css_property('background-color'))
# print(page_one_btn.value_of_css_property('color'))
# print(page_two_btn.value_of_css_property('background-color'))
# print(page_two_btn.value_of_css_property('color'))


# # assert page_one_btn.value_of_css_property("color") == "#ffffff"
# # assert page_two_btn.value_of_css_property("color") == "#5cb85c"
# assert page_one_btn.get_attribute("class") == "page-item active"
page_two_btn.click()
time.sleep(2)

assert page_two_btn.value_of_css_property('color') == active_button_color_value
assert page_one_btn.value_of_css_property('color') == inactive_button_color_value
#
#
# print(page_one_btn.value_of_css_property('background-color'))
# print(page_one_btn.value_of_css_property('color'))
# print(page_two_btn.value_of_css_property('background-color'))
# print(page_two_btn.value_of_css_property('color'))
# # assert page_one_btn.value_of_css_property("color") == "#5cb85c"
# # assert page_two_btn.value_of_css_property("color") == "#ffffff"
#
# assert page_two_btn.get_attribute("class") == "page-item active"
#


# settings = WebDriverWait(browser, 2).until(
#     EC.presence_of_element_located((By.XPATH, '//a[@href = "#/settings"]')))
# settings.click()
#
# profile_pic_field = WebDriverWait(browser, 2).until(
#     EC.presence_of_element_located((By.XPATH, '//input[@placeholder="URL of profile picture"]')))
# profile_pic_original = profile_pic_field.get_attribute("value")
#
# print(profile_pic_original)
# time.sleep(3)
# #author = WebDriverWait(browser, 2).until(EC.presence_of_all_elements_located((By.XPATH, '//a[@class="author" and  @href = "#/@testuser1/"]')))
# author = browser.find_elements_by_xpath('//a[@href = "#/@testuser1/" and @class="author"]')
# author[0].click()
# time.sleep(3)
# author_articles_titles = browser.find_elements_by_xpath('//a[@class="preview-link"]//h1')
# #author_articles_titles = WebDriverWait(browser, 2).until(EC.presence_of_all_elements_located((By.XPATH, '//a[@class="preview-link"]//h1')))
#
# # first_title = browser.find_elements_by_xpath('//a[@class="preview-link"]//h1')[0]
# # print(first_title.text)
#
# print(len(author_articles_titles))
# for i in author_articles_titles:
#     print(i.text)


#assert author_articles_titles[0].text == "Lorem ipsum dolor sit amet"
# author_articles_titles_list = []
# print(author_articles_titles[0].text)
# for i in author_articles_titles:
#     author_articles_titles_list.append(i.text)
#
# print(author_articles_titles_list)
# with open("result.txt", "w", encoding='UTF-8') as result_content:
#     for title in author_articles_titles:
#         result_content.write("%s\n" % title)

browser.quit()

