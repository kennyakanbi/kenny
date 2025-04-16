from django.contrib import admin
from .models import *

admin.site.register(Contact)
admin.site.register(Blogs) 


class InternshipAdmin(admin.ModelAdmin):
    List_display = ('fullname',
                    'usn',
                    'email',
                    'college_name',
                    'offer_status',
                    'start_date',
                    'end_date',
                    'timeStamp')
    search_fields=('fullname', 'usn', 'email')
    List_filter=['college_name', 'proj_report', 'offer_status']
admin.site.register(Internship, InternshipAdmin) 
