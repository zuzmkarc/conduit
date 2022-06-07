import time


def login(browser, user_email, user_password):
    sign_in_page_btn = browser.find_element_by_xpath('//a[@href="#/login"]')
    sign_in_page_btn.click()
    email_input = browser.find_element_by_xpath('//input[@type="text"]')
    password_input = browser.find_element_by_xpath('//input[@type="password"]')
    sign_in_btn = browser.find_element_by_xpath('//button[@class="btn btn-lg btn-primary pull-xs-right"]')
    email_input.send_keys(user_email)
    password_input.send_keys(user_password)
    sign_in_btn.click()


def create_article(browser, title_input, about_input, main_input, tag_input):
    new_article_btn = browser.find_element_by_xpath('//a[@href="#/editor"]')
    new_article_btn.click()
    time.sleep(2)
    article_title_input = browser.find_element_by_xpath('//input[@placeholder="Article Title"]')
    article_about_input = browser.find_element_by_xpath('//input[starts-with(@placeholder,"What")]')
    article_main_input = browser.find_element_by_xpath('//textarea[@placeholder="Write your article (in markdown)"]')
    article_tags_input = browser.find_element_by_xpath('//input[@placeholder="Enter tags"]')
    article_submit_btn = browser.find_element_by_xpath('//button[@type="submit"]')
    article_title_input.send_keys(title_input)
    article_about_input.send_keys(about_input)
    article_main_input.send_keys(main_input)
    article_tags_input.send_keys(tag_input)
    article_submit_btn.click()


def write_comment(browser, comment_text):
    comment_input = browser.find_element_by_xpath('//textarea[@placeholder="Write a comment..."]')
    post_comment_btn = browser.find_element_by_xpath('//button[@class="btn btn-sm btn-primary"]')
    comment_input.send_keys(comment_text)
    post_comment_btn.click()
    time.sleep(2)