import 'package:flutter/material.dart';

void main() => runApp(ContactListApp());

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({required this.name, required this.email, required this.phoneNumber});
}

class ContactListApp extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
      name: 'Hamim Ahamed Ornab',
      email: 'hamimahamed22@gmail.com',
      phoneNumber: '01744153749',
    ),
    Contact(
      name: 'Hafizur Rahman Araf',
      email: 'araf123@gmail.com',
      phoneNumber: '01712345678',
    ),
    Contact(
      name: 'Moynul Islam',
      email: 'moynul321@gmail.com',
      phoneNumber: '01812345678',
    ),
  ];

  ContactListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contact List'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(contacts[index].name),
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return ContactDetailsSheet(contact: contacts[index]);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ContactDetailsSheet extends StatelessWidget {
  final Contact contact;

  const ContactDetailsSheet({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Contact Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text('Name: ${contact.name}'),
              const SizedBox(height: 8),
              Text('Email: ${contact.email}'),
              const SizedBox(height: 8),
              Text('Phone: ${contact.phoneNumber}'),
            ],
          ),
        ),
      ),
    );
  }
}
