# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('article', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='comments',
            field=models.ForeignKey(to='article.Comment', null=True),
        ),
        migrations.AlterField(
            model_name='catagory',
            name='articles',
            field=models.ForeignKey(to='article.Article', null=True),
        ),
        migrations.AlterField(
            model_name='comment',
            name='replies',
            field=models.ForeignKey(to='article.Reply', null=True),
        ),
    ]
