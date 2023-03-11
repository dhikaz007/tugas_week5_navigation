import 'package:flutter/material.dart';

import '../../data/model/list_icon_data.dart';
import '../contact/contact_list_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: iconsList.length,
        itemBuilder: (context, index) => _choiceMenu(context, index));
  }

  _choiceMenu(BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          child: Card(
              elevation: 5.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(iconsList[index].icon,
                      color: Colors.amberAccent, size: 50))),
          onTap: () {
            if (index == 7) {
              _goToContact(context);
            }
          },
        ),
        const SizedBox(height: 8.0),
        Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              iconsList[index].namaIcon,
              textAlign: TextAlign.center,
            )),
      ],
    );
  }

  _goToContact(context) {
    final route = MaterialPageRoute(builder: (context) => const ContactListPage());
    // Navigator tanpa route
    Navigator.of(context).push(route);
    // Navigator menggunakan route
    //Navigator.of(context).pushNamed('/Contact List');
  }
}
