import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Entry point
void main() {
  runApp(const MyApp());
}

// Root widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'iTravel',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

// App-wide state (empty for now)
class MyAppState extends ChangeNotifier {
  // List of trips stored globally in the Trip class to store images
  final List<Trip> trips = [];

  // Function to add a new trip
  void addTrip(String destination, String note) {
    trips.add(Trip(destination: destination, notes: note, imgPath: "assets/travel_plane.webp"));
    notifyListeners(); // Tells widgets to rebuild
  }

  // Function to delete a trip
  void removeTrip(int index) {
    trips.removeAt(index);
    notifyListeners(); // Rebuild the list
  }
}

// Home page with NavigationRail
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;

    // Switch between pages
    switch (selectedIndex) {
      case 0:
        page = const HomePage();
        break;
      case 1:
        page = const TripsPage();
        break;
      default:
        page = const HomePage();
    }

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Trips'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}

// -------- Pages --------

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _notescontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Watch trip list
    final appState = context.watch<MyAppState>();

    // Uses SafeArea to prevent the pages from being cropped by cameras
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title for the home page
            const Text(
              'iTravel',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
      
            // Subtitle for the page
            const Text(
              'Add a destination and plan your trips',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
      
            const SizedBox(height: 20),
            // Input field
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Type a destination',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
      
            TextField(
              controller: _notescontroller,
              decoration: const InputDecoration(
                labelText: 'Notes (optional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
      
            // Submit button
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  appState.addTrip(_controller.text, _notescontroller.text);
                  _controller.clear();
                }
              },
              child: const Text('Add Trip'),
            ),
      
            const SizedBox(height: 20),
      
            // Display trips or empty message
            Expanded(
              child:
                  appState
                      .trips
                      .isEmpty // If the list is empty show ? first
                  ? const Center(
                      child: Text(
                        'No trips yet!',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  // Else
                  : ListView.builder(
                      itemCount: appState.trips.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                appState.trips[index].imgPath,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(appState.trips[index].destination),
                            subtitle: Text(appState.trips[index].notes),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                appState.removeTrip(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
            
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: appState.trips.isEmpty
          ? const Center(
              child: Text(
                'No trips added yet!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: appState.trips.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.flight),
                  title: Text(appState.trips[index].destination),
                );
              },
            ),
    );
  }
}


class Trip {
  final String destination;
  final String notes;
  final String imgPath;

  Trip({
    required this.destination,
    required this.notes,
    required this.imgPath,
  });
}