# Generated by Django 2.1.5 on 2020-02-29 21:26

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('CRM', '0001_initial'),
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Asset',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=500)),
                ('type', models.CharField(choices=[('current', 'Current'), ('fixed', 'Fixed')], default='current', max_length=200)),
                ('open_balance', models.IntegerField(blank=True, default=0)),
                ('amount', models.IntegerField(default=0)),
                ('memo', models.CharField(max_length=200)),
                ('dated', models.DateField(default=datetime.datetime.now)),
            ],
        ),
        migrations.CreateModel(
            name='Bank',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(choices=[('Payment', 'Payment'), ('Sales Receipt', 'Sales reciept')], default='Payment', max_length=50)),
                ('ref_number', models.CharField(max_length=100)),
                ('dated', models.DateField(default=datetime.datetime.now)),
                ('name', models.CharField(max_length=200)),
                ('banked', models.CharField(max_length=200)),
                ('amount', models.PositiveIntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Deduction',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nssf', models.IntegerField()),
                ('nhif', models.IntegerField()),
                ('nhsb', models.IntegerField()),
                ('paye', models.IntegerField()),
                ('dated', models.DateTimeField(default=datetime.datetime.now)),
                ('employee', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='accounts.Employee')),
            ],
        ),
        migrations.CreateModel(
            name='Expense',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_of_expense', models.DateField(default=datetime.datetime.now)),
                ('memo', models.CharField(max_length=1000)),
                ('bill_due', models.DateField(default=datetime.datetime.now)),
                ('terms_of_payment', models.CharField(choices=[('Pay immediately', 'Pay immediately'), ('Bill in 10 days', 'Bill in 10 days'), ('Bill in 20 days', 'Bill in 20 days'), ('Bill in 30 days', 'Bill in 30 days'), ('Bill in 60 days', 'Bill in 60 days')], default='Pay Immediately', max_length=100)),
                ('payment_method', models.CharField(choices=[('mpesa', 'Mpesa'), ('bank cheque', 'Bank cheque'), ('cash', 'Cash')], default='Bank Cheque', max_length=200)),
                ('VAT', models.CharField(choices=[('yes', 'Yes'), ('no', 'No')], default='yes', max_length=10)),
                ('ref_no', models.CharField(blank=True, max_length=100)),
                ('amount', models.PositiveIntegerField(default=0)),
                ('expense_type', models.CharField(choices=[('operational', 'Operational')], default='operational', max_length=100)),
                ('vendor', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='CRM.Supplier')),
            ],
        ),
        migrations.CreateModel(
            name='Income',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('type', models.CharField(choices=[('other incomes', 'Other incomes'), ('direct income', 'Direct income')], default='direct income', max_length=200)),
                ('amount', models.IntegerField(default=0)),
                ('open_balance', models.IntegerField(blank=True, default=0)),
                ('memo', models.CharField(max_length=200)),
                ('dated', models.DateField(default=datetime.datetime.now)),
                ('member', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='CRM.Member')),
            ],
        ),
        migrations.CreateModel(
            name='Invoice',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_of_generate', models.DateField(default=datetime.datetime.now)),
                ('description', models.CharField(max_length=2000)),
                ('VAT', models.CharField(choices=[('Yes', 'Yes'), ('No', 'No')], default='No', max_length=5)),
                ('amount', models.PositiveIntegerField(blank=True, default=0)),
                ('balance', models.PositiveIntegerField(blank=True, default=0)),
                ('member', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='CRM.Client')),
            ],
        ),
        migrations.CreateModel(
            name='Liability',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200)),
                ('type', models.CharField(choices=[('current', 'Current'), ('short-term', 'Short-term')], default='current', max_length=100)),
                ('amount', models.IntegerField(default=0)),
                ('open_balance', models.IntegerField(blank=True, default=0)),
                ('memo', models.CharField(max_length=200)),
                ('dated', models.DateField(default=datetime.datetime.now)),
            ],
        ),
        migrations.CreateModel(
            name='Payment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(max_length=1000)),
                ('payment_for', models.CharField(choices=[('Membership', 'Membership'), ('Renewal', 'Renewal'), ('Others', 'Others')], default='Membership', max_length=100)),
                ('date_of_generate', models.DateField(default=datetime.datetime.now)),
                ('VAT', models.CharField(choices=[('Yes', 'Yes'), ('No', 'No')], default='No', max_length=5)),
                ('amount', models.PositiveIntegerField(blank=True, default=0)),
                ('member', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='CRM.Client')),
            ],
        ),
        migrations.CreateModel(
            name='PayRoll',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pension', models.IntegerField(default=0)),
                ('lunch', models.IntegerField(default=0)),
                ('month', models.DateField(default=datetime.datetime.now)),
                ('is_taxed', models.BooleanField(default=False)),
                ('employee', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='accounts.Employee')),
            ],
        ),
        migrations.CreateModel(
            name='Sales',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('payment_due', models.DateField(default=datetime.datetime.now)),
                ('payment_terms', models.CharField(max_length=200)),
                ('date_of_sale', models.DateField(default=datetime.datetime.now)),
                ('invoice', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='ACCNTS.Invoice')),
                ('member', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='CRM.Client')),
            ],
        ),
    ]
