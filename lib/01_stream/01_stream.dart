import 'package:flutter/material.dart';

class LearnStream extends StatelessWidget {
  const LearnStream({Key? key}) : super(key: key);

  Stream<int> _count() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
      ),
      body: StreamBuilder(
        stream: _count(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text('Loading...'),
            );
          }
          return Center(
            child: Text('${snapshot.data}'),
          );
        },
      ),
    );
  }
}
