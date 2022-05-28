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

# time.sleep(3)

# settings = WebDriverWait(browser, 2).until(
#     EC.presence_of_element_located((By.XPATH, '//a[@href = "#/settings"]')))
# settings.click()
#
# profile_pic_field = WebDriverWait(browser, 2).until(
#     EC.presence_of_element_located((By.XPATH, '//input[@placeholder="URL of profile picture"]')))
# profile_pic_original = profile_pic_field.get_attribute("value")
#
# print(profile_pic_original)

author = WebDriverWait(browser, 2).until(
    EC.presence_of_all_elements_located((By.XPATH, '//a[@class="author" and  @href = "#/@testuser1/"]')))
author[0].click()
author_articles_titles = WebDriverWait(browser, 2).until(
    EC.presence_of_all_elements_located((By.XPATH, '//a[@class="preview-link"]//h1')))

first_title = browser.find_elements_by_xpath('//a[@class="preview-link"]//h1')[0]
print(first_title.text)
titles_list = []
for i in author_articles_titles:
    titles_list.append(i.text)
    print(titles_list)

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

