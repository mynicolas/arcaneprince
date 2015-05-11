#!/usr/bin/env python
# coding: utf-8

import os
import sys

path = '/home/django/arcaneprince/'
if path not in sys.path:
  sys.path.insert(0, path)
os.environ["DJANGO_SETTINGS_MODULE"] = "arcaneprince.settings"

import django
django.setup()
import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
