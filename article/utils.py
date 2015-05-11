#!/usr/bin/env python
#-*- coding: utf-8 -*-
from models import *
import json
from datetime import datetime as dateTime
from pygments import highlight
from pygments.lexers import PythonLexer
from pygments.formatters import HtmlFormatter
from django.core.serializers.json import DjangoJSONEncoder


class Arcane(object):
  def __init__(self, **kwargs):
    self.catagoryId = kwargs.get('catagoryId', None)
    self.articleId = kwargs.get('articleId', None)
    self.commentId = kwargs.get('commentId', None)
    self.replyId = kwargs.get('replyId', None)

    self.catagory = kwargs.get('catagory', None)
    self.article = kwargs.get('article', None)
    self.comment = kwargs.get('comment', None)
    self.reply = kwargs.get('reply', None)

    self.object = None

  @property
  def catagories(self):
    catagoryIds = []
    cs = Catagory.objects.all()
    for c in cs:
      catagoryIds.append(c.id)

    return catagoryIds

  @property
  def result(self):
    content = None
    if self.replyId:
      content = self._getReply(self.replyId)
    elif self.commentId:
      content = self._getComment(self.commentId)
    elif self.articleId:
      content = self._getArticle(self.articleId)
    elif self.catagoryId:
      content = self._getCatagory(self.catagoryId)

    return content

  def add(self):
    if self.catagory:
      isSave = self._addCatagory(self.catagory)
    elif self.article:
      isSave = self._addArticle(self.article)
    elif self.comment:
      isSave = self._addComment(self.comment)
    elif self.reply:
      isSave = self._addReply(self.reply)

    return isSave

  def remove(self):
    if self.object:
      self.object.delete()
    else:
      if self.catagoryId:
        self._removeCatagory(self.catagoryId)
      elif self.articleId:
        self._removeArticle(self.articleId)
      elif self.commentId:
        self._removeComment(self.commentId)
      elif self.replyId:
        self._removeReply(self.replyId)

  def _getReply(self, replyId):
    reply = Reply.objects.get(id=replyId)
    self.object = reply
    content = {
      "replyId": reply.id,
      "nick": reply.nick,
      "owner": reply.owner,
      "content": reply.content,
      "datetime": reply.datetime,
      "commentId": reply.comment_id
    }
    return content

  def _getComment(self, commentId):
    comment = Comment.objects.get(id=commentId)
    self.object = comment
    replies = comment.reply_set.all()
    thisReplies = []
    for i in replies:
      thisReplies.append(self._getReply(i.id))

    content = {
      "commentId": comment.id,
      "nick": comment.nick,
      "datetime": comment.datetime,
      "content": comment.content,
      "articleId": comment.article_id,
      "replies": thisReplies
    }
    return content

  def _getArticle(self, articleId):
    article = Article.objects.get(id=articleId)
    self.object = article
    comments = article.comment_set.all()
    thisComments = []
    for i in comments:
      thisComments.append(self._getComment(i.id))

    content = {
      "articleId": article.id,
      "title": article.title,
      "datetime": article.datetime,
      "content": article.content,
      "catagoryId": article.catagory_id,
      "catagory": article.catagory.name,
      "comments": thisComments
    }
    return content

  def _getCatagory(self, catagoryId):
    catagory = Catagory.objects.get(id=catagoryId)
    self.object = catagory
    articles = catagory.article_set.all()
    thisArticles = []
    for i in articles:
      thisArticles.append(self._getArticle(i.id))

    content = {
      "catagoryId": catagory.id,
      "name": catagory.name,
      "articles": thisArticles
    }
    return content

  def _addReply(self, reply):
    commentId = reply['commentId']
    nick = reply['nick']
    email = reply['email']
    owner = reply['owner']
    datetime = dateTime.now()
    content = reply['content']

    newReply = Reply.objects.create(
      nick=nick,
      email=email,
      owner=owner,
      datetime=datetime,
      content=content
    )
    newReply.save()

    thisComment = Comment.objects.get(id=commentId)
    thisComment.reply_set.add(newReply)
    thisComment.save()
    self.object = newReply

    msg = "%\r\n< %s >" % (content, email)
    self.sendEmail(user=nick, content=msg)
    return newReply.id

  def _addComment(self, comment):
    articleId = comment['articleId']
    nick = comment['nick']
    email = comment['email']
    datetime = dateTime.now()
    content = comment['content']

    newComment = Comment.objects.create(
      nick=nick,
      email=email,
      datetime=datetime,
      content=content
    )
    newComment.save()

    thisArticle = Article.objects.get(id=articleId)
    thisArticle.comment_set.add(newComment)
    thisArticle.save()
    self.object = newComment

    msg = "%s\r\n< %s >" % (content.encode('gb2312'), email)
    self.sendEmail(user=nick, content=msg)
    return newComment.id

  def sendEmail(self, **kwargs):
    import smtplib
    from email.mime.text import MIMEText

    smtp = smtplib.SMTP()
    smtp.connect("smtp.sina.com", "25")
    smtp.login('arcaneprince@sina.com', 'shuang1991')
    msg = MIMEText(kwargs['content'])
    msg['Subject'] = kwargs['user']
    msg['From'] = "arcaneprince@sina.com"
    msg['To'] = "arcaneprince@sina.com"
    try:
      smtp.sendmail('arcaneprince@sina.com', 'arcaneprince@sina.com', msg.as_string())   
      smtp.quit()
      return True
    except:
      return False

  def _addArticle(self, article):
    title = article['title']
    datetime = dateTime.now()
    content = self._pygmentify(article['content'])
    articleId = article.get('articleId', None)
    catagoryId = article.get('catagoryId', None)

    try:
      Article.objects.get(title=title)
      return False
    except:

      if(articleId):
        thisArticle = Article.objects.get(id=articleId)
        thisArticle.content = content
        thisArticle.title = title
        thisArticle.catagory = Catagory.objects.get(id=catagoryId)
        thisArticle.save()
        return thisArticle

      newArticle = Article.objects.create(
        title=title,
        datetime=datetime,
        content=content
      )
      newArticle.save()
      self.object = newArticle

      return newArticle


  def _pygmentify(self, content):
    newContent = []
    for i in content:
      if i['type'] == "code":
        i['detail'] = highlight(i['detail'], PythonLexer(), HtmlFormatter())
      newContent.append(i)
    return json.dumps(newContent)


  def _addCatagory(self, catagory):
    name = catagory['name']
    articles = catagory['articles']

    try:
      thisCatagory = Catagory.objects.get(name=name)
    except:
      thisCatagory = Catagory.objects.create(name=name)

    thisCatagory.save()
    self.object = thisCatagory

    for i in articles:
      thisCatagory.article_set.add(self._addArticle(i))

    return thisCatagory.id

  def _removeReply(self, replyId):
    reply = Reply.objects.get(id=replyId)
    reply.delete()
    return True

  def _removeComment(self, commentId):
    comment = Comment.objects.get(id=commentId)
    comment.delete()
    return True

  def _removeArticle(self, articleId):
    article = Article.objects.get(id=articleId)
    catagory = article.catagory
    articles = catagory.article_set.all()
    article.delete()
    if not articles:
      catagory.delete()
    return True

  def _removeCatagory(self, catagoryId):
    catagory = Catagory.objects.get(id=catagoryId)
    catagory.delete()
    return True


class Search(object):
  def __init__(self, query):
    self.query = query

  @property
  def result(self):
    if self.query:
      _results = self._queryArticle(self.query)
      return json.dumps(_results, cls=DjangoJSONEncoder)

  def _queryArticle(self, query):
    articles = Article.objects.filter(content__icontains=query) | Article.objects.filter(title__icontains=query)
    if articles:
      _result = []
      for article in articles:
        _querySet = {}
        _querySet['title'] = article.title
        _querySet['articleId'] = article.id
        _result.append(_querySet)
      return _result
    else:
      return []


def getCatagories():
  arcane = Arcane()
  catagoryIds = arcane.catagories
  catagories = []
  for catagoryId in catagoryIds:
    catagory = {}
    _arcane = Arcane(catagoryId=catagoryId).result
    catagory['name'] = _arcane['name']
    _articles = _arcane['articles']
    articles = []
    for i in _articles:
      _article = {}
      _article['title'] = i['title']
      _article['articleId'] = i['articleId']
      articles.append(_article)
    catagory['articles'] = articles
    catagories.append(catagory)
  return json.dumps(catagories, cls=DjangoJSONEncoder)


def getRecentArticles():
  from datetime import datetime
  _articles = Article.objects.filter(
    datetime__year=datetime.now().year, 
    datetime__month=datetime.now().month
  )
  articles = []
  for _article in _articles:
    arcane = Arcane(articleId=_article.id)
    articles.append(arcane.result)
  return json.dumps(articles, cls=DjangoJSONEncoder)


def getArticle(articleId):
  arcane = Arcane(articleId=articleId)
  article = [arcane.result]
  return json.dumps(article, cls=DjangoJSONEncoder)


def getArticleTitle(articleId):
  arcane = Arcane(articleId=articleId)
  return json.dumps(arcane.result["title"], cls=DjangoJSONEncoder)

