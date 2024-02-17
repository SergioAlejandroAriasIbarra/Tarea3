import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        // useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(title: 'Menu Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Explore the restaurants delicious menu items below",
              overflow: TextOverflow.visible,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Roboto',
                color: Colors.black,
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: datos.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedIndex == index) {
                          selectedIndex = -1;
                        } else {
                          selectedIndex = index;
                        }
                      });
                    },
                    child: ListTileWidget(
                      asset: datos[index]["asset"]!,
                      text: datos[index]["text"]!,
                      isSelected: selectedIndex == index,
                    ),
                  );
                },
              ),
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          showPickupAlertDialog(context);
                        },
                        child: Text("Pickup")),
                  ),
                  VerticalDivider(
                    thickness: 2,
                    width: 20,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          showDeliveryAlertDialog(context);
                        },
                        child: Text("Delivery")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showPickupAlertDialog(BuildContext context) {
    String title = "Pickup";
    String message = "No hay nada seleccionado";

    if (selectedIndex != -1) {
      String asset = datos[selectedIndex]["asset"]!;
      String text = datos[selectedIndex]["text"]!;
      message = text;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showDeliveryAlertDialog(BuildContext context) {
    String title = "Delivery";
    String message = "No hay nada seleccionado";

    if (selectedIndex != -1) {
      String asset = datos[selectedIndex]["asset"]!;
      String text = datos[selectedIndex]["text"]!;
      message = text;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final String asset;
  final String text;
  final bool isSelected;
  const ListTileWidget({
    Key? key,
    required this.asset,
    required this.text,
    required this.isSelected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected ? Colors.lightBlueAccent : Colors.transparent,
      child: ListTile(
        leading: Image.asset(asset),
        title: Text(text),
      ),
    );
  }
}

List<Map<String, String>> datos = [
  {"asset": "assets/burger.png", "text": "Burger"},
  {"asset": "assets/dogo.png", "text": "Hot Dog"},
  {"asset": "assets/fries.png", "text": "Fries"},
  {"asset": "assets/soda.png", "text": "Soda"},
  {"asset": "assets/ice.png", "text": "Ice Cream"},
];
