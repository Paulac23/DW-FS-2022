# Generated by Django 4.2.1 on 2023-05-20 07:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('primer_app', '0009_alter_carrito_id_carrito_alter_carrito_persona_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='suscripcion',
            name='tipo',
            field=models.CharField(blank=True, choices=[('SUS1', 'Suscripcion Tipo 1'), ('SUS2', 'Suscripcion Tipo 2'), ('SUS3', 'Suscripcion Tipo 3'), ('SUS4', 'Suscripcion Tipo 4'), ('SUS5', 'Suscripcion Tipo 5')], max_length=4, null=True, verbose_name='Tipo de Suscripción'),
        ),
    ]
