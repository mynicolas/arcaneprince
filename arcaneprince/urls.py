from django.conf.urls import patterns, include, url
from article import urls as articleUrls
from views import *

urlpatterns =  patterns('',
    url(r'^', include(articleUrls)),
)
