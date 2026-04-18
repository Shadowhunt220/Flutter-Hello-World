void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
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
  String selectedOption = 'Opción 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Welcome to Flutter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ROW: Para poner elementos en horizontal
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 30),
                SizedBox(width: 10),
                Text('Hello World', style: TextStyle(fontSize: 20)),
                SizedBox(width: 10),
                Icon(Icons.favorite, color: Colors.red, size: 30),
              ],
            ),
            
            const SizedBox(height: 30),
            
            // CONTAINER: Para dar estilo, padding, márgenes, etc.
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: const Text(
                'Este es un Container con estilo',
                style: TextStyle(fontSize: 16),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // DROPDOWN: Selector desplegable
            DropdownButton<String>(
              value: selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
              },
              items: <String>['Opción 1', 'Opción 2', 'Opción 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            
            const SizedBox(height: 30),
            
            // STACK: Superponer elementos
            SizedBox(
              height: 150,
              width: 250,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 120,
                    width: 220,
                    color: Colors.green.shade200,
                  ),
                  Container(
                    height: 80,
                    width: 180,
                    color: Colors.yellow.shade200,
                  ),
                  const Text(
                    'Stack (superposición)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
