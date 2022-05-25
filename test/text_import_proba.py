# comment_field = browser.find_element_by_xpath('//textarea[@placeholder="Write a comment..."]')
#         comment_field.clear()
with open('comments_data.txt', 'r', encoding='UTF-8') as f:
    file_content = f.readline()
    while file_content:
        print(file_content, end='')
        file_content = f.readline()
