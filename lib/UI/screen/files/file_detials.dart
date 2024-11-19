import 'package:flutter/material.dart';

class FileDetials extends StatefulWidget {
  const FileDetials({super.key});

  @override
  State<FileDetials> createState() => _FileDetialsState();
}

class _FileDetialsState extends State<FileDetials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "File Name",
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.check)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.download))
        ],
      ),
    );
  }
}
