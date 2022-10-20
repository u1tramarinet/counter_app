import 'package:counter_app/viewmodel/notifier/counter_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterViewModel {
  final Ref ref;

  CounterViewModel(this.ref);

  Future<void> increment() async {
    await ref.read(counterNotifierProvider.notifier).increment();
  }
}

final viewModelProvider = Provider((ref) => CounterViewModel(ref));
