import requests
import pymysql
from bs4 import BeautifulSoup
from urllib import parse
import re

# 伪装爬取头部，以防止被网站禁止
headers = {'Host': 'book.douban.com',
           'User-Agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko)\
         Chrome/63.0.3239.132 Safari/537.36'}

def db_book(key):
    url = 'https://book.douban.com/tag/' + parse.quote(key)
    response = requests.get(url,headers=headers,timeout=10)
    file = response.content.decode('utf-8')
    soup = BeautifulSoup(file,'lxml')

    date_list = soup.select('#subject_list > ul > li')
    if date_list != []:
        for date in date_list:
            book_type = key
            title = date.find('h2').a['title'] #书名
            rating = date.find('span',class_='rating_nums').get_text().strip() #评分
            try:
                context = date.find('div',class_='info').p.get_text().replace('\n','') #介绍
            except:
                context = '暂无介绍'
            img = date.find('img')['src'] #图片
            img_url = 'https://images.weserv.nl/?url=' + img.replace('https://','')

            c_number = date.find('span',class_='pl').get_text().strip()
            c_number = re.findall(r'\d+',c_number)[0]#评论人数

            e_date = date.find('div',class_='pub').get_text().strip().split('/')
            author = ','.join(e_date[0:-3]).strip() #作者
            press = e_date[-3].strip()#出版社
            publication_date =e_date[-2].strip()  #出版时间
            price = e_date[-1].strip() #价格

            print({'分类':book_type,
                   '书名': title,
                   '作者': author,
                   '出版社': press,
                   '日期': publication_date,
                   '价格': price,
                   '评分':rating,
                   '人数': c_number,
                   '图片':img_url,
                   '简介':context})
    else:
        content = '豆瓣上暂时还没有人给书标注 "{}"'.format(key)
        print(content)

db_book('数学')




