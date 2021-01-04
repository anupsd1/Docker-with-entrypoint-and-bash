from django.shortcuts import render, HttpResponse
from .tasks import my_task

# Create your views here.
def hello(request):
    my_task.delay("nowwwwww")
    return HttpResponse("<h1>HIII</h1>")