import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});
  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Drawer(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                UserAccountsDrawerHeader(
                    currentAccountPicture: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network('https://t4.ftcdn.net/jpg/03/02/76/57/240_F_302765753_5vrPxvGXSl4X63p9WeWTxliKRPeVE5Y9.jpg'),
                    ),
                    accountName: Text('Sreypich Khoeun'),
                    accountEmail: Text('khoeusreypich@gmail.com')
                ),
                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.favorite),
                  title: Text('Hello'),
                ),
                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.favorite),
                  title: Text('Hello'),
                ),
              ],
            )
        ),
      );
  }
}
