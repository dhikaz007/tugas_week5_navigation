import 'package:flutter/material.dart';

import '../../data/model/contact_data.dart';
import 'add_contact_page.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        actions: [
          TextButton(
              onPressed: () => _addNewContact(context),
              style: style,
              child: const Icon(Icons.add_rounded)),
        ],
      ),
      body: ListView.builder(
          itemCount: cList.length,
          itemBuilder: (context, index) => _listContacts(index)),
    );
  }

  _listContacts(int index) {
    /// List kontak yang ditampilkan menggunakan widget ListTile
    return ListTile(
      leading: CircleAvatar(child: Text(cList[index].name[0])),
      title: Text('${cList[index].name} ${cList[index].lastName}'),
      subtitle: Text(cList[index].numberPhone),
    );
  }

  _addNewContact(context) {
    //  Navigasi ke halaman add contact
    final route =
        MaterialPageRoute(builder: (context) => AddContactPage(addList: cList));
    Navigator.push(context, route)
        .then((value) => setState(() => cList = value)); // Data yang dikirim dari halaman add contact kemudian di tambahkan ke dalam halaman kontak list
  }
}
