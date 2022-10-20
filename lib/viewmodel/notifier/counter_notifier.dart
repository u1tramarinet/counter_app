import 'package:counter_app/model/counter_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends StateNotifier<AsyncValue<int>> {
  CounterNotifier(this.ref) : super(const AsyncValue<int>.loading());

  final Ref ref;
  late CounterRepository repository;

  Future<void> initialize() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    repository = ref.read(counterRepositoryProvider);
    state = AsyncValue.data(repository.count);
  }

  Future<void> increment() async {
    state = const AsyncValue<int>.loading();
    repository.increment().whenComplete(() {
      state = AsyncValue.data(repository.count);
    });
  }
}

final counterNotifierProvider =
    StateNotifierProvider<CounterNotifier, AsyncValue<int>>(
        (ref) => CounterNotifier(ref)..initialize());
