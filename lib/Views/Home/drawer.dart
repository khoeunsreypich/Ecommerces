import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});
  @override
  Widget build(BuildContext context) {
      return Drawer(
        width: MediaQuery.of(context).size.width * .75,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('Khoeun Sreypich'),
              accountEmail: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Personal Account'),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Switch')),
                  ),
                ],
              ),
              currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    'https://iv1.lisimg.com/image/21450866/740full-dasha-taran-(ii).jpg',
                    fit: BoxFit.fill,
                  )),
              currentAccountPictureSize: const Size.square(50),
            ),
            const ListTile(
              title: Text('Call'),
              leading: Icon(Icons.call_outlined),
            ),
            const ListTile(
              title: Text('Saved Message'),
              leading: Icon(Icons.save_alt_outlined),
            ),
            const ListTile(
              title: Text('option 1'),
              leading: Icon(Icons.add),
            ),
            const ListTile(
              title: Text('option 1'),
              leading: Icon(Icons.contact_emergency),
            ),
            const ListTile(
              title: Text('option 1'),
              leading: Icon(Icons.contact_emergency),
            ),
            const ListTile(
              title: Text('option 1'),
              leading: Icon(Icons.contact_emergency),
            ),


          ],
        ),
      );
  }
}
