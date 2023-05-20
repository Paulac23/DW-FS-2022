# Generated by Django 4.2.1 on 2023-05-20 07:15

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('primer_app', '0008_alter_publicacion_foto'),
    ]

    operations = [
        migrations.AlterField(
            model_name='carrito',
            name='id_carrito',
            field=models.AutoField(primary_key=True, serialize=False, verbose_name='ID del Carrito'),
        ),
        migrations.AlterField(
            model_name='carrito',
            name='persona',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='primer_app.persona', verbose_name='Usuario Dueño del Carrito'),
        ),
        migrations.AlterField(
            model_name='comentarios',
            name='fecha_creacion',
            field=models.DateField(auto_now=True, verbose_name='Fecha de Publicación'),
        ),
        migrations.AlterField(
            model_name='comentarios',
            name='fecha_modificacion',
            field=models.DateField(auto_now=True, verbose_name='Fecha de Modificación'),
        ),
        migrations.AlterField(
            model_name='comentarios',
            name='id_comentario',
            field=models.AutoField(primary_key=True, serialize=False, verbose_name='ID del Comentario'),
        ),
        migrations.AlterField(
            model_name='comentarios',
            name='publicacion_comentada',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='primer_app.publicacion', verbose_name='Publicación Comentada'),
        ),
        migrations.AlterField(
            model_name='comentarios',
            name='usuario_comentante',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='primer_app.persona', verbose_name='Usuario que Comenta'),
        ),
        migrations.AlterField(
            model_name='persona',
            name='apellidos',
            field=models.CharField(max_length=60, verbose_name='Apellido/s'),
        ),
        migrations.AlterField(
            model_name='persona',
            name='correo',
            field=models.EmailField(max_length=254, verbose_name='E-mail'),
        ),
        migrations.AlterField(
            model_name='persona',
            name='dni',
            field=models.IntegerField(verbose_name='DNI'),
        ),
        migrations.AlterField(
            model_name='persona',
            name='fecha_alta',
            field=models.DateField(auto_now_add=True, verbose_name='Fecha de creación'),
        ),
        migrations.AlterField(
            model_name='persona',
            name='id_persona',
            field=models.AutoField(primary_key=True, serialize=False, verbose_name='ID de Usuario'),
        ),
        migrations.AlterField(
            model_name='persona',
            name='nombres',
            field=models.CharField(max_length=60, verbose_name='Nombre/s'),
        ),
        migrations.AlterField(
            model_name='persona',
            name='rol_admin',
            field=models.BooleanField(verbose_name='Usuario Administrador'),
        ),
        migrations.AlterField(
            model_name='persona',
            name='usuario',
            field=models.CharField(max_length=15, verbose_name='Nombre de Usuario'),
        ),
        migrations.AlterField(
            model_name='publicacion',
            name='categoria',
            field=models.CharField(choices=[('VEHI', 'Vehiculos'), ('ELEC', 'Electrodomesticos'), ('COME', 'Comestibles'), ('HOGA', 'Hogar'), ('JUGU', 'Juegos y Juguetes')], max_length=4, verbose_name='Categoria del Articulo'),
        ),
        migrations.AlterField(
            model_name='publicacion',
            name='estado',
            field=models.BooleanField(verbose_name='Objeto sin uso'),
        ),
        migrations.AlterField(
            model_name='publicacion',
            name='fecha_modificacion',
            field=models.DateField(auto_now=True, verbose_name='Fecha de Modificación'),
        ),
        migrations.AlterField(
            model_name='publicacion',
            name='fecha_publicacion',
            field=models.DateField(auto_now_add=True, verbose_name='Fecha de Publicación'),
        ),
        migrations.AlterField(
            model_name='publicacion',
            name='foto',
            field=models.ImageField(blank=True, null=True, upload_to='', verbose_name='Imagen'),
        ),
        migrations.AlterField(
            model_name='publicacion',
            name='id_publicacion',
            field=models.AutoField(primary_key=True, serialize=False, verbose_name='ID de Publicación'),
        ),
        migrations.AlterField(
            model_name='publicacion',
            name='publicante',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='primer_app.persona', verbose_name='Usuario Publicante'),
        ),
        migrations.AlterField(
            model_name='suscripcion',
            name='id_suscripcion',
            field=models.AutoField(primary_key=True, serialize=False, verbose_name='ID de la Suscripción'),
        ),
    ]
