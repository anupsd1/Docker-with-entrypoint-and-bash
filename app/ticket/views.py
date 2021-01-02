from django.shortcuts import render
from .tasks import my_task

# Create your views here.
def hello(request):
    my_task("nowwwwww")