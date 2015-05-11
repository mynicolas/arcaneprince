from django.conf.urls import patterns, include, url
from views import *

urlpatterns =  patterns('',
  url(r'^login/$', login),
  url(r'^logout/$', logout),
  url(r'^super/', adm),
  url(r'^$', index),
  url(r'^search/$', search),
  url(r'^catagories/$', getCatagories),
  url(r'^candr/$', saveCommentAndReply),
  url(r'^title/(.*)/$', getArticleTitle),
  url(r'^article/(.*)/$', getArticle),
  url(r'^save/$', saveArticle),
  url(r'^delete/$', deleteArticle),
)
