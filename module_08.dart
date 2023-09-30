import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Layout Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: orientation == Orientation.portrait
          ? PortraitLayout()
          : LandscapeLayout(),
    );
  }
}

class PortraitLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: ClipOval(
              child: Image.network(
                'https://images.unsplash.com/photo-1608848461950-0fe51dfc41cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80', // Replace with your image URL
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            title: Center(
                child: Text(
                  'Rakib\n',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                )),
            subtitle: Text(
                'HLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            padding: EdgeInsets.all(10),
            mainAxisSpacing: 10,
            children: List.generate(6, (index) {
              return Image.network(
                'https://images.unsplash.com/photo-1608848461950-0fe51dfc41cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80', // Replace with your image URL
                fit: BoxFit.cover,
              );
            }),
          ),
        ],
      ),
    );
  }
}

class LandscapeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            child: ClipOval(
              child: Image.network(
                'https://images.unsplash.com/photo-1608848461950-0fe51dfc41cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80', // Replace with your image URL
                width: 200, // Adjust the size as needed
                height: 200, // Adjust the size as needed
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  'Rakib\n',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'),
              ),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(10),
                  crossAxisCount: 3,
                  children: List.generate(6, (index) {
                    return Image.network(
                      'https://images.unsplash.com/photo-1608848461950-0fe51dfc41cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80', // Replace with your image URL
                      fit: BoxFit.cover,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
