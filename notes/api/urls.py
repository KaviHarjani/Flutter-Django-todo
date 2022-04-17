from django.urls import path

from . import views

urlpatterns = [
    path("", views.getNotes, name="notes"),
    path("create/", views.createNote, name="create"),
    path("update/<str:pk>", views.updateNote, name="update"),
    path("delete/<str:pk>", views.deleteNote, name="delete"),
    path("<str:pk>/", views.getNote, name="note"),
]
