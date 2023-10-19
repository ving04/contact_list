import 'package:flutter/material.dart';
import 'package:contact_list/pages/contact_detail_page.dart';
import 'package:contact_list/repositories/agenda_repository.dart';

import '../models/agenda_model.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  late AgendaRepository agendaRepository;

  var agendaModel = AgendaModel();

  @override
  void initState() {
    agendaRepository = AgendaRepository();
    loadContactsList();
    super.initState();
  }

  loadContactsList() async {
    agendaModel = await agendaRepository.getContacts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactDetailPage(
                    objctId: '',
                    name: '',
                    phoneNumber: '',
                    email: '',
                    imagePath: '',
                  ),
                ),
              );
              //print(agendaModel);
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            await loadContactsList();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: agendaModel.results == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: agendaModel.results?.length,
                        itemBuilder: (context, index) {
                          var contactList = agendaModel.results?[index];
                          return Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) async {
                              await agendaRepository
                                  .deleteById(contactList.objectId);
                            },
                            child: Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ContactDetailPage(
                                        objctId: contactList.objectId,
                                        name: contactList.name,
                                        phoneNumber: contactList.phoneNumber,
                                        email: contactList.email,
                                        imagePath: contactList.imagePath,
                                      ),
                                    ),
                                  );
                                },
                                leading: CircleAvatar(
                                  backgroundColor: Colors.purple,
                                  child: Text(
                                    contactList!.name[0],
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                                title: Text(contactList.name),
                                isThreeLine: true,
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(contactList.phoneNumber),
                                    Text(contactList.email)
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
