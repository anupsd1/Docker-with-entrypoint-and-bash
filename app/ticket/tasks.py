# Create your tasks here

from celery import shared_task


@shared_task
def my_task(user_pk=None):
    print("We received this  " + str(user_pk))
