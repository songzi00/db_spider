
# Create your views here.
from django.http import HttpResponse
from django.shortcuts import render,redirect
from .models import User,books
from .forms import UserForm,RegisterForm
import requests
from bs4 import BeautifulSoup
from urllib import parse
import re

def index(request):
    if request.POST == {}:

        return render(request,'login/index.html')

    elif request.method == 'POST':
        a = request.POST['content']
        book = books.objects.filter(category=a)
        if book:
            x = []
            y1 = []
            y2 = []
            book = books.objects.filter(category=a)
            for bok in book:
                x.append(bok.name)
                y1.append(bok.access)
                y2.append(bok.number)

            data = {
                'books':book,
                'x':x,
                'y1':y1,
                'y2':y2,
                'category':a
            }

        else:
            content = ""
            headers = {'Host': 'book.douban.com',
                       'User-Agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko)\
                     Chrome/63.0.3239.132 Safari/537.36'}
            url = 'https://book.douban.com/tag/' + a
            response = requests.get(url, headers=headers, timeout=10)
            file = response.content.decode('utf-8')
            soup = BeautifulSoup(file, 'lxml')

            date_list = soup.select('#subject_list > ul > li')
            if date_list != []:
                for date in date_list:
                    book_type = a
                    title = date.find('h2').a['title']  # 书名
                    rating = date.find('span', class_='rating_nums').get_text().strip()  # 评分
                    img = date.find('img')['src']  # 图片
                    img_url = 'https://images.weserv.nl/?url=' + img.replace('https://', '')
                    c_number = date.find('span', class_='pl').get_text().strip()
                    c_number = re.findall(r'\d+', c_number)[0]  # 评论人数
                    context = date.find('div', class_='info').p.get_text().replace('\n', '')  # 介绍
                    e_date = date.find('div', class_='pub').get_text().strip().split('/')
                    author = ','.join(e_date[0:-3]).strip()  # 作者
                    press = e_date[-3].strip()  # 出版社
                    publication_date = e_date[-2].strip()  # 出版时间
                    price = e_date[-1].strip()  # 价格
                    detail = books.objects.create()
                    detail.access = rating
                    detail.author = author
                    detail.name = title
                    detail.price = price
                    detail.number = c_number
                    detail.time = publication_date
                    detail.publish = press
                    detail.context = context
                    detail.category = a
                    detail.img = img_url
                    detail.save()



            else:
                content = '暂时没有 "{}"这个种类'.format(a)
                print(content)



            x = []
            y1 = []
            y2 = []
            book = books.objects.filter(category=a)
            if book:
                for bok in book:
                    x.append(bok.name)
                    y1.append(bok.access)
                    y2.append(bok.number)
            data = {
                'books':book,
                'x':x,
                'y1':y1,
                'y2':y2,
                'category':a,
                'content':content,
            }


        return render(request,'login/index.html',context=data)




def login(request):
    if request.session.get('is_login', None):
        return redirect('/index')

    if request.method == "POST":
        login_form = UserForm(request.POST)
        message = "请检查填写的内容！"
        if login_form.is_valid():
            username = login_form.cleaned_data['username']
            password = login_form.cleaned_data['password']
            try:
                user =User.objects.get(name=username)
                if user.password == password:
                    request.session['is_login'] = True
                    request.session['user_id'] = user.id
                    request.session['user_name'] = user.name
                    return redirect('/index/')
                else:
                    message = "密码不正确！"
            except:
                message = "用户不存在！"
                return render(request, 'login/login.html', locals())

    login_form = UserForm()
    return render(request, 'login/login.html', locals())


def register(request):

    if request.session.get('is_login', None):
        # 登录状态不允许注册。你可以修改这条原则！
        return redirect("/index/")
    if request.method == "POST":
        register_form = RegisterForm(request.POST)
        message = "请检查填写的内容！"
        if register_form.is_valid():  # 获取数据
            username = register_form.cleaned_data['username']
            password1 = register_form.cleaned_data['password1']
            password2 = register_form.cleaned_data['password2']
            email = register_form.cleaned_data['email']
            sex = register_form.cleaned_data['sex']
            if password1 != password2:  # 判断两次密码是否相同
                message = "两次输入的密码不同！"
                return render(request, 'login/register.html', locals())
            else:
                same_name_user = User.objects.filter(name=username)
                if same_name_user:  # 用户名唯一
                    message = '用户已经存在，请重新选择用户名！'
                    return render(request, 'login/register.html', locals())
                same_email_user = User.objects.filter(email=email)
                if same_email_user:  # 邮箱地址唯一
                    message = '该邮箱地址已被注册，请使用别的邮箱！'
                    return render(request, 'login/register.html', locals())

                # 当一切都OK的情况下，创建新用户

                new_user = User.objects.create()
                new_user.name = username
                new_user.password = password1
                new_user.email = email
                new_user.sex = sex
                new_user.save()
                return redirect('/login/')  # 自动跳转到登录页面

    register_form = RegisterForm()
    return render(request, 'login/register.html', locals())


def logout(request):
    if not request.session.get("is_login" ,None):
        return redirect("/index/")

    request.session.flush()
    return redirect("/index/")


def book(request,category):
    book = books.objects.filter(category=category)
    data = {
        'books':book
    }
    return render(request,'login/book.html',context=data)


