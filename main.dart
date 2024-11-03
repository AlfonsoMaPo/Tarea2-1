import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Screen',
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: ListView(
          children:[
            CircleAvatar(radius: 45,backgroundImage: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')),
            SizedBox(height: 10),
            
            Center(child: Column(children:[
            Text('Coffeestories',
              style:TextStyle(fontSize: 24, fontWeight: FontWeight.w500, 
              color: Colors.black
              ),
            ),
              
            Text('mark.brock@icloud.com',
              style: TextStyle(color: Colors.grey),
            ),
          ],
          ),
          ),
        
          SizedBox(height: 10),
          Container(width: 5,
          child: ElevatedButton(
          onPressed: () {},
          child: Text('Edit profile',
          style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          ),
       ),
      ),

        SizedBox(height: 20),
          Opciones(title: 'Inventories',
          items: [ListTile(leading: Icon(Icons.store),
          title: Row(children: [
          Text('My stores'),
          SizedBox(width: 8), 
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Text('2',
            style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          ],
          ),
         trailing: Icon(Icons.arrow_forward_ios, size: 16),
         ),
           const Divider(),
            OpcionesData(icon: Icons.support, title: 'Support'),
          ],
            ),
            SizedBox(height: 20),
            Opciones(
              title: 'Preferences',
              items:[OpcionesData(icon: Icons.notifications,title: 'Push notifications',
              trailingWidget: Switch(value: true, onChanged: (value) {}),
                ),
              const Divider(),
              OpcionesData(icon: Icons.face,title: 'Face ID',
              trailingWidget: Switch(value: true, onChanged: (value) {}),
              ),
              const Divider(),
              OpcionesData(icon: Icons.lock, title: 'PIN Code'),
              const Divider(),
              OpcionesData(icon: Icons.logout,title: 'Logout',
              titleColor: Colors.red
              ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class Opciones extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const Opciones({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Card(child: Column(children: items)),
      ],
    );
  }
}

class OpcionesData extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailing;
  final Widget? trailingWidget;
  final Color? titleColor;

  const OpcionesData({
    required this.icon,
    required this.title,
    this.trailing,
    this.trailingWidget,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title,
      style: TextStyle(color: titleColor),
      ),
      trailing: trailingWidget ?? Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
