# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('article', '0003_merge'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='article',
            name='comments',
        ),
        migrations.RemoveField(
            model_name='catagory',
            name='articles',
        ),
        migrations.RemoveField(
            model_name='comment',
            name='replies',
        ),
        migrations.AddField(
            model_name='article',
            name='catagory',
            field=models.ForeignKey(to='article.Catagory', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='comment',
            name='article',
            field=models.ForeignKey(to='article.Article', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='reply',
            name='comment',
            field=models.ForeignKey(to='article.Comment', null=True),
            preserve_default=True,
        ),
    ]
