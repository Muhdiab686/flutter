import 'package:flutter/material.dart';

class FilesScreen extends StatefulWidget {
  const FilesScreen({super.key});

  @override
  State<FilesScreen> createState() => _FilesScreenState();
}

class _FilesScreenState extends State<FilesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          child: const Text("Files"),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(14),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.3))
                      ]),
                  child: ListTile(
                      leading: CircleAvatar(
                        child: Text("${index + 1} "),
                      ),
                      title: const Text(
                        "File 2",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        "this file create by user2",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.archive))),
                );
              },
              itemCount: 7,
            )
          ],
        ),
      ),
    );
  }
}
