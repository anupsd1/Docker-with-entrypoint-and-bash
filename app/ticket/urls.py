from django.conf.urls import url
from django.urls import path
from .views import hello

urlpatterns = [
    url(r'^check/', hello),
]
