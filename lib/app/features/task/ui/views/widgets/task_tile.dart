import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:todo_app_riverpod/app/features/task/data/model/task.dart';
import 'package:todo_app_riverpod/app/features/task/ui/controllers/task_controller.dart';
import 'package:todo_app_riverpod/app/features/task/ui/views/widgets/edit_button.dart';

class TaskTile extends ConsumerStatefulWidget {
  const TaskTile({
    // required this.task,
    required this.index,
    super.key,
  });

  // final Task task;
  final int index;

  @override
  ConsumerState<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends ConsumerState<TaskTile> {
  @override
  Widget build(BuildContext context) {
    // final task = ref.read(taskControllerProvider).tasks[widget.index];

    final state = ref.watch(taskControllerProvider);

    // if (state.isLoading) {
    //   return const CircularProgressIndicator();
    // } else {}

    // switch (state) {
    //   case AsyncLoading():
    //     const CircularProgressIndicator();
    //     break;
    //   default:
    // }
    return Container(
      height: 91,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // color: Colors.red,
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: 
         _TileContent(
            index: widget.index,
          ),
        // AsyncError() => const Text('Oops, something unexpected happened'),
        // _ => const CircularProgressIndicator(),
      
    );
  }
}

class _TileContent extends ConsumerWidget {
  const _TileContent({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(getTasksProvider).value!.tasks[index];
    return Row(
      children: [
        // checkbox
        RoundCheckBox(
          size: 32,
          isChecked: task.isDone,
          onTap: (selected) {
            final newTask = Task(isDone: !task.isDone, title: task.title);
            ref
                .read(taskControllerProvider.notifier)
                .checkTask(newTask, index);
          },
        ),

        const Gap(12),

        // text
        Text(
          task.title,
          style: TextStyle(
            color: task.isDone ? Colors.grey : Colors.black,
            decoration: task.isDone ? TextDecoration.lineThrough : null,
            decorationColor: Colors.black,
          ),
        ),

        const Spacer(),

        // edit btn

        EditButton(
          props: (task: task, index: index),
        ),
      ],
    );
  }
}
