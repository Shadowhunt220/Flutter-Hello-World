import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Películas Clásicas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedOption = 'Todas las películas';

  // Columna izquierda con información
  Widget get leftColumn {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Mensaje de bienvenida
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            children: [
              Icon(Icons.movie, color: Colors.deepPurple),
              SizedBox(width: 10),
              Text(
                '¡Bienvenido a Cine Clásico!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Dropdown para filtrar
        const Text(
          'Filtrar por categoría:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        DropdownButton<String>(
          value: selectedOption,
          isExpanded: true,
          onChanged: (String? newValue) {
            setState(() {
              selectedOption = newValue!;
            });
          },
          items: <String>['Todas las películas', 'Acción', 'Drama', 'Musicales']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        
        const SizedBox(height: 30),
        
        // Lista de películas destacadas
        const Text(
          'Películas destacadas:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView(
            children: const [
              ListTile(
                leading: Icon(Icons.local_movies),
                title: Text('Grease (1978)'),
                subtitle: Text('John Travolta, Olivia Newton-John'),
              ),
              ListTile(
                leading: Icon(Icons.local_movies),
                title: Text('Scarface (1983)'),
                subtitle: Text('Al Pacino'),
              ),
              ListTile(
                leading: Icon(Icons.local_movies),
                title: Text('Pulp Fiction (1994)'),
                subtitle: Text('John Travolta, Uma Thurman'),
              ),
              ListTile(
                leading: Icon(Icons.local_movies),
                title: Text('Amadeus (1984)'),
                subtitle: Text('F. Murray Abraham'),
              ),
              ListTile(
                leading: Icon(Icons.local_movies),
                title: Text('Ran (1985)'),
                subtitle: Text('Akira Kurosawa'),
              ),
              ListTile(
                leading: Icon(Icons.local_movies),
                title: Text('The Mask of Zorro (1998)'),
                subtitle: Text('Anthony Hopkins, Antonio Banderas'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget de la imagen principal
  Widget get mainImage {
    return Container(
      width: 400,
      height: 600,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        image: DecorationImage(
          image: AssetImage('assets/Peliculas_clasicas.webp'),
          // Si la imagen está en internet, usa NetworkImage:
          // image: NetworkImage('https://tu-url.com/imagen.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.play_circle_filled, size: 60, color: Colors.white70),
              SizedBox(height: 10),
              Text(
                'Películas Clásicas',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'El arte que trasciende el tiempo',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text(
          '🎬 Películas Clásicas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Acción de búsqueda
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Función de búsqueda próximamente')),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey.shade100,
              Colors.deepPurple.shade50,
            ],
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
            height: 600,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 440, child: leftColumn),
                  mainImage,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
