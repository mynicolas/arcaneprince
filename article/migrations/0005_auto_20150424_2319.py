# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('article', '0004_auto_20150424_2225'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='article',
            name='date',
        ),
        migrations.AddField(
            model_name='article',
            name='datetime',
            field=models.DateTimeField(default=datetime.datetime(2015, 4, 24, 23, 19, 55, 428000)),
            preserve_default=False,
        ),
    ]
