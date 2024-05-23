import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importa el paquete intl

void main() {
  runApp(MyApp());
}

class Cine {
  final String titulo;
  final DateTime fechaPelicula;
  final String categoria;
  final String imagen;
  final Duration duracion;

  Cine({
    required this.titulo,
    required this.fechaPelicula,
    required this.categoria,
    required this.imagen,
    required this.duracion,
  });
}

class CineCard extends StatelessWidget {
  final Cine cine;

  const CineCard({Key? key, required this.cine}) : super(key: key);

  String formatDuracion(Duration duracion) {
    int horas = duracion.inHours;
    int minutos = duracion.inMinutes.remainder(60);
    return '${horas}h ${minutos}m';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cine.titulo,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text('Fecha: ${DateFormat('dd-MM-yyyy').format(cine.fechaPelicula)}'),
            SizedBox(height: 5.0),
            Text('Categoría: ${cine.categoria}'),
            SizedBox(height: 5.0),
            Image.asset(
              cine.imagen,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 5.0),
            Text('Duración: ${formatDuracion(cine.duracion)}'),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cine App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CineListScreen(),
    );
  }
}

class CineListScreen extends StatelessWidget {
  final List<Cine> peliculas = [
    Cine(
      titulo: 'Deadpool 3',
      fechaPelicula: DateTime(2024, 07, 26),
      categoria: 'Acción/Comedia',
      imagen: 'images/Deadpool.png',
      duracion: Duration(hours: 2, minutes: 07),
    ),
    Cine(
      titulo: 'El planeta de los simios: nuevo reino',
      fechaPelicula: DateTime(2024, 05, 10),
      categoria: 'Acción/Ciencia ficción',
      imagen: 'images/Simios.png',
      duracion: Duration(hours: 2, minutes: 25),
    ),
    Cine(
      titulo: 'Garfield: fuera de casa',
      fechaPelicula: DateTime(2024, 05, 24),
      categoria: 'Infantil/Comedia',
      imagen: 'images/Garfield.png',
      duracion: Duration(hours: 1, minutes: 31),
    ),
    Cine(
      titulo: 'Furiosa: de la saga Mad Max',
      fechaPelicula: DateTime(2024, 04, 24),
      categoria: 'Acción/Aventura',
      imagen: 'images/Furiosa.png',
      duracion: Duration(hours: 2, minutes: 28),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CineTec - Perú')),
      body: ListView.builder(
        itemCount: peliculas.length,
        itemBuilder: (context, index) {
          return CineCard(cine: peliculas[index]);
        },
      ),
    );
  }
}