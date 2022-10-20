import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterRepository {
  CounterRepository(this.ref);

  final Ref ref;
  int count = 0;

  Future<void> increment() async {
    await Future.delayed(const Duration(seconds: 1));
    count++;
  }
}

final counterRepositoryProvider = Provider((ref) => CounterRepository(ref));
