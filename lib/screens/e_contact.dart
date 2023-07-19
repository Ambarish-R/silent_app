import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter_contacts/flutter_contacts.dart';

class e_contact extends StatefulWidget {
  const e_contact({Key? key}) : super(key: key);

  @override
  State<e_contact> createState() => _e_contactState();
}

class _e_contactState extends State<e_contact> {
 /*  // ignore: non_constant_identifier_names
   with SingleTickerProviderStateMixin {
  final ContactPicker _contactPicker = new ContactPicker();
  Contact _contact;
  String _name = "";
  String mobile = "";

  @override
  Widget build(BuildContext context) {
    String test;
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.blue,
        title: new Text("Contact Picker"),
      ),
      body: new Padding(
        padding: EdgeInsets.only(left: 1.0, top: 15.0, right: 1.0, bottom: 1.0),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: 10.0, top: 8.0, right: 10.0, bottom: 1.0),
              child: new Row(
                children: <Widget>[
                  new Flexible(
                    flex: 17,
                    child: new Container(
                      child: new TextField(
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            hintStyle: new TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                            hintText: "Pick Contact",
                            fillColor: Color(0xFFEDEDED)),
                      ),
                    ),
                  ),
                   new Flexible(
                      flex: 3,
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () async {
                              Contact contact =
                                  await _contactPicker.selectContact();
                              setState(() {
                                _contact = contact;
                                _name = _contact.fullName;
                                mobile = _contact.phoneNumber.toString();
                              });
                            },
                            child: new Image.asset(
                              'assets/images/phone_book.png',
                              width: 40.0,
                              height: 40.0,
                            ),
                          )))
                ],
              ),
            ),
            _contact == null
                ? new Container()
                : Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text(_name),
                          subtitle: Text(mobile),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );

    // TODO: implement build
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
*/
/*
  var dummyData = <Map>[
    {
      "id": 1,
      "name": "Mom",
      "imageURL": "https://www.w3schools.com/howto/img_avatar.png"
    },
    {
      "id": 2,
      "name": "Dad",
      "imageURL": "https://www.w3schools.com/w3images/avatar2.png"
    },
    {
      "id": 3,
      "name": "Senthil",
      "imageURL": "https://www.w3schools.com/howto/img_avatar.png"
    },
    {
      "id": 4,
      "name": "Deva",
      "imageURL":
          "https://cdn.icon-icons.com/icons2/1736/PNG/512/4043260-avatar-male-man-portrait_113269.png"
    }
  ];
  @override
  deleteContact(index) {
    setState(() {
      dummyData.removeAt(index);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Text("Emergency contacts"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (BuildContext context, int index) {
            return (ListTile(
              leading: Image.network(dummyData[index]["imageURL"]),
              title: Text(dummyData[index]["name"]),

              subtitle: Text("+91030929092"),
              // ignore: prefer_const_constructors
              trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    deleteContact(index);
                  }),
            ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
*/
 List<Contact>? contacts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContact();
  }

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      print(contacts);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          title: const Text("Emergency contacts"),
          actions :[IconButton(
        icon: const Icon(
             Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        }),]
        ),
        body: (contacts) == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: contacts!.length,
                itemBuilder: (BuildContext context, int index) {
                  Uint8List? image = contacts![index].photo;
                  String num = (contacts![index].phones.isNotEmpty)
                      ? (contacts![index].phones.first.number)
                      : "--";
                  return ListTile(
                    leading: (contacts![index].photo == null)
                        ? const CircleAvatar(child: Icon(Icons.person))
                        : CircleAvatar(backgroundImage: MemoryImage(image!)),
                    title: Text(
                        "${contacts![index].name.first} ${contacts![index].name.last}"),
                    subtitle: Text(num),
                    trailing: const Icon(Icons.add),
                    /*onTap: () {
                        if (contacts![index].phones.isNotEmpty) {
                          launch('tel: ${num}');
                        }
                        }
                        */
                  );
                },
              ));
  }
}
