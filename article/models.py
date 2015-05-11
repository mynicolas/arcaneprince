from django.db import models

class Catagory(models.Model):
  name = models.CharField(max_length=32)


class Article(models.Model):
  title = models.CharField(max_length=32)
  datetime = models.DateTimeField()
  content = models.TextField()
  catagory = models.ForeignKey(Catagory, null=True)


class Comment(models.Model):
  nick = models.CharField(max_length=32)
  email = models.EmailField(null=True)
  datetime = models.DateTimeField()
  content = models.TextField()
  article = models.ForeignKey(Article, null=True)


class Reply(models.Model):
  nick = models.CharField(max_length=32)
  email = models.EmailField(null=True)
  owner = models.CharField(max_length=32)
  datetime = models.DateTimeField()
  content = models.TextField()
  comment = models.ForeignKey(Comment, null=True)

