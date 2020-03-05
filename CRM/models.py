from django.db import models
from django.urls import reverse
from helpers.help import get_country, get_sectors, get_categs
import os, time, random, string
from accounts.models import Employee
import datetime
from uuid import uuid4
from django.utils.deconstruct import deconstructible
from multiselectfield import MultiSelectField
from django_countries.fields import CountryField

# Create your models here.

@deconstructible
class UploadFolder(object):

    def __init__(self, sub_path):
        self.path = sub_path

    def __call__(self, instance, filename):
        ext = filename.split('.')[-1]
        # set filename as random string
        filename = '{}.{}'.format(uuid4().hex, ext)
        # return the whole path to the file
        return os.path.join(self.path, filename)


file_upload = UploadFolder("documents/clients")

class Client(models.Model):

    Prenom = models.CharField(max_length=100, null=True, blank=True)
    Nom = models.CharField(max_length=100, null=True, blank=True)
    Sexe_choix = (('Male', 'MALE'), ('Female', 'FEMALE'))
    Sexe = models.CharField(max_length=20, choices=Sexe_choix, default=None)
    photo = models.ImageField(upload_to='uploads/', blank=True, null=True)
    Email = models.EmailField(max_length=200, unique=True, blank=True)
    tel_f = models.IntegerField(default = 123456)
    tel_p = models.IntegerField(default = 123456)
    pays = CountryField(max_length=200, unique=True, blank=True)
    Nationality = models.CharField(max_length=200, unique=True, blank=True)
    archive = models.BooleanField(default=True)
    Matricule = models.IntegerField(default = 123456)

    company_name = models.CharField(max_length = 100)
    member_number = models.CharField(max_length = 100, default=0)
    member_prefix = models.CharField(max_length=20, default =0)
    date_of_issue = models.DateField(default = datetime.datetime.now)
    certificate_of_incorporation = models.FileField(upload_to=file_upload, blank = True)
    copy_of_id = models.FileField(upload_to=file_upload,  blank = True)
    copy_of_blank_cheque = models.FileField(upload_to=file_upload, blank = True)
    copy_of_trade_licence = models.FileField(upload_to=file_upload, blank = True)
    list_of_product_barcoded = models.FileField(upload_to=file_upload, blank = True)
    director_pin_number = models.FileField(upload_to=file_upload, blank = True)
    company_certificate_pin = models.FileField(upload_to=file_upload, blank = True)
    copy_of_kebs_certicate = models.FileField(upload_to=file_upload, blank = True)
    is_me1 = models.IntegerField(default=0)
    is_me2 = models.IntegerField(default=0)
    is_cacc_x = models.IntegerField(default=0)
    is_ccm = models.IntegerField(default=0)
    is_accm = models.IntegerField(default=0)
    is_cacc = models.IntegerField(default=0)
    is_tm = models.IntegerField(default=0)
    is_gm = models.IntegerField(default=0)
    status = models.IntegerField(default=0)
    def get_absolute_url(self):
        return reverse("CRM:list_client")

    def __str__(self):
        return self.company_name
    def wrapper():
        return
    
    class meta :
         managed=False
    
   
    

class Supplier(models.Model):
    name = models.CharField(max_length = 100)
    phone  = models.IntegerField()
    country = models.CharField(max_length = 100, choices = get_country(),  default = "No sector")
    website = models.CharField(blank = True, max_length =100)
    description = models.CharField(max_length = 1000)

    def wrapper():
        return

    def __str__(self):
        return self.name
    
    def get_absolute_url(self):
        return reverse("CRM:list_supplier")


class Feedback(models.Model):
    STATUS = (
        (1, "close"),
        (11, "open"),
        (0, "pending")
    )
    client_name = models.ForeignKey(Client, on_delete = models.CASCADE, default=1)
    feedback  = models.CharField(max_length = 1000)
    status = models.BooleanField(default = False)
    created_on = models.DateField(default = datetime.datetime.now)
    status = models.IntegerField(choices= STATUS)

    def __str__(self):
        return self.feedback

    def get_absolute_url(self):
        return reverse("CRM:list_feedback")
    


def get_clients():
    list_clients = Client.objects.all()
    clients = []
    for cl in list_clients:
        clients.append((cl.id, cl.company_name ,))
    return tuple(clients)

'''
Coding from spacemacs
'''
class Event(models.Model):
    event_name = models.CharField(max_length=300)
    training = models.ForeignKey("Training", related_name ="trian", on_delete=models.CASCADE, default=1)
    date_time = models.DateField(default = datetime.datetime.now)
    status = models.IntegerField(default = 1)

    def __str__(self):
        return self.event_name
    def get_absolute_url(self):
        return reverse("CRM:list_event")



class Training(models.Model):
    trainer = models.ForeignKey(Employee, on_delete = models.CASCADE, default =1)
    all_trainee = MultiSelectField(choices=get_clients(), max_length=3, blank=True, null=True)
    happened_on  = models.DateField(default = datetime.datetime.now)
    description = models.CharField(max_length= 2000)
    def __str__(self):
        return self.trainer.user.username
    def get_absolute_url(self):
        return reverse("CRM:list_training")

class Barcode(models.Model):
    GTIN = models.CharField(max_length = 40, unique = True)
    client = models.ForeignKey("Client", on_delete=models.CASCADE, default=1)
    product_description = models.CharField(max_length = 100)
    brand_name = models.CharField(max_length = 100)
    name_packaging = models.CharField(max_length = 100, blank = True)
    type = models.CharField(max_length=50)
    depth = models.CharField(max_length=50, blank = True)
    width = models.CharField(max_length=50, blank = True)
    height = models.CharField(max_length=50, blank = True)
    gross_weight = models.CharField(max_length=50, blank = True) 
    net_weight = models.CharField(max_length=50, blank = True)
    size = models.IntegerField(blank = True)
    def __str__(self):
        return self.GTIN

    def get_absolute_url(self):
        return reverse("CRM:detail_barcode", kwargs={"pk": self.pk})


"""
Providing Notes for the Clients Activations"""

class Note(models.Model):
    member = models.ForeignKey(Client, on_delete = models.CASCADE)
    current_user = models.ForeignKey(Employee, on_delete = models.CASCADE)
    notes = models.CharField(max_length = 1000)
    dated = models.DateTimeField(default = datetime.datetime.now)

    def __str__(self):
        return str(self.notes)[:50]
"""
Record who approved the member records
"""
class RecordApprove(models.Model):
    member = models.ForeignKey(Client, on_delete = models.CASCADE)
    current_user = models.ForeignKey(Employee, on_delete = models.CASCADE)
    dated = models.DateTimeField(default = datetime.datetime.now)

    def __str__(self):
        return self.member.user.username

"""
'company_name', 'company_phone', 'company_phone_alt', 'company_email','certificate_of_incorporation','copy_of_id', 'copy_of_blank_cheque',
            'copy_of_trade_licence', 'list_of_product_barcoded', 'director_pin_number', 'company_certificate_pin', 'copy_of_kebs_certicate',
             'company_email_alt', 'post_address', 'physical_location', 'director_info','sector','date_of_issue', 'nature_of_business
"""

class Member(models.Model):
    name        = models.CharField(max_length = 200)
    email               = models.CharField(max_length = 200)
    phone               = models.CharField(max_length = 200)
    address             = models.CharField(max_length = 200)
    country             = models.CharField(max_length = 200, blank = True)
    description         = models.CharField(max_length = 400, blank = True)

    def __str__(self):
        return self.name


