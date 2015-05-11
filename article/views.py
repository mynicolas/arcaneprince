#!/usr/bin/env python
#-*- coding: utf-8 -*-
from django.shortcuts import Http404
from django.shortcuts import HttpResponse
from django.shortcuts import HttpResponseRedirect
from django.shortcuts import render_to_response
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from article import utils


def index(request):
  return render_to_response("index.html")


def login(request):
  username = request.POST['username']
  password = request.POST['password']
  user = auth.authenticate(username=username, password=password)
  if user:
    auth.login(request, user)
    return HttpResponseRedirect('/super/')
  else:
    return HttpResponseRedirect('/')


def logout(request):
  auth.logout(request)
  return HttpResponseRedirect('/')


@login_required
def adm(request):
  return render_to_response("admin.html")


def getCatagories(request):
  catagories = utils.getCatagories()
  return HttpResponse(catagories, content_type="application/json")


def getArticle(request, articleId):
  if articleId == "recent":
    articles = utils.getRecentArticles()
    return HttpResponse(articles, content_type="application/json")
  else:
    thisArticle = utils.getArticle(articleId)
    return HttpResponse(thisArticle, content_type="application/json")


def getArticleTitle(request, articleId):
  return HttpResponse(utils.getArticleTitle(articleId))


@login_required
def saveArticle(request):
  newArticle = eval(request.GET['newArticle'])['catagory']
  arcane = utils.Arcane(catagory=newArticle)
  newCatagoryId = arcane.add()
  return HttpResponse(newCatagoryId)


@login_required
def deleteArticle(request):
  articleId = request.POST['articleId']
  arcane = utils.Arcane(articleId=articleId)
  arcane.remove()
  return HttpResponse('deleted')


def saveCommentAndReply(request):
  commentOrReply = request.GET
  kind = commentOrReply['type']
  nick = commentOrReply['nick']
  content = commentOrReply['content']
  email = commentOrReply['email']
  if kind == 'comment':
    comment = {
      'nick': nick,
      'email': email,
      'articleId': commentOrReply['commentId'],
      'content': content
    }
    arcane = utils.Arcane(comment=comment)
    return HttpResponse(arcane.add())

  elif kind == 'reply':
    reply = {
      'commentId': commentOrReply['replyId'],
      'nick': nick,
      'email': email,
      'content': content,
      'owner': commentOrReply['owner']
    }
    arcane = utils.Arcane(reply=reply)
    return HttpResponse(arcane.add())


def search(request):
  searchResult = utils.Search(request.GET['query'])
  return HttpResponse(searchResult.result)
