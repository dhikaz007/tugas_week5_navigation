// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/model/contact_data.dart';
import '../../widget/input_contact _widget.dart';

class AddContactPage extends StatelessWidget {
  AddContactPage({super.key, required this.addList});

  late List<ContactData> addList;

  String? _firstName;
  String? _lastName;
  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create New Contact')),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            InputContactWidget(
                keyboardType: TextInputType.text,
                prefixIcon: Icons.person_rounded,
                label: 'First Name',
                hintText: 'Enter your first name',
                onFieldSubmitted: (value) => _firstName = value),
            const SizedBox(height: 8.0),
            InputContactWidget(
                keyboardType: TextInputType.text,
                prefixIcon: Icons.person_rounded,
                label: 'Last Name',
                hintText: 'Enter your last name',
                onFieldSubmitted: (value) => _lastName = value),
            const SizedBox(height: 8.0),
            InputContactWidget(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                prefixIcon: Icons.phone_rounded,
                label: 'Phone Number',
                hintText: 'Enter your phone number',
                onFieldSubmitted: (value) => _phoneNumber = value),
            const SizedBox(height: 8.0),
            ElevatedButton(
                onPressed: () => _updateContact(context),
                child: const Text('SAVE')),
          ])),
    );
  }

  // Menambah kontak baru pada halaman list kontak
  _updateContact(BuildContext context) {
    addList.add(ContactData(
        name: _firstName ?? '',
        lastName: _lastName ?? '',
        numberPhone: _phoneNumber ?? ''));
    Navigator.pop(context, addList);
  }
}
