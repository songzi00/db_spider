from django.db import models
# Create your models here.

class User(models.Model):
    objects = models.Manager()
    """用户表"""

    gender = (
        ('male','男'),
        ('female','女'),
    )

    name = models.CharField(max_length = 128,unique = True)
    password = models.CharField(max_length = 256)
    email = models.EmailField(unique = True)
    sex = models.CharField(max_length = 32,choices = gender,default = "男")
    c_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['c_time']
        verbose_name = '用户'
        verbose_name_plural = '用户'

class books(models.Model):
    objects = models.Manager()
    name = models.CharField(max_length=64)
    category = models.CharField(max_length=64)
    author = models.CharField(max_length=64)
    publish = models.CharField(max_length=32)
    time = models.CharField(max_length=64)
    price = models.CharField(max_length=32)
    img = models.CharField(max_length=256,default='111')
    context = models.CharField(max_length=256)
    number = models.CharField(max_length=64)
    access = models.CharField(max_length=32)


