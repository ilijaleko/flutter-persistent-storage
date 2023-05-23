import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../hive/models/bootcamp_lecture_model.dart';

class HiveScreen extends StatefulWidget {
  const HiveScreen({Key? key}) : super(key: key);

  @override
  State<HiveScreen> createState() => _HiveScreenState();
}

class _HiveScreenState extends State<HiveScreen> {
  late Box<BootcampLecture> _bootcampLectureBox;

  @override
  void initState() {
    super.initState();
    _bootcampLectureBox = Hive.box<BootcampLecture>('bootcamp_lecture');
  }

  final TextEditingController _lectureNameController = TextEditingController();
  final TextEditingController _lectureDescriptionController =
      TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive library'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Text('Add new lecture'),
              const SizedBox(height: 10),
              TextField(
                controller: _lectureNameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Lecture name',
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 50.0),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text('Select date'),
                  ),
                ],
              ),
              TextField(
                controller: _lectureDescriptionController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Lecture description',
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black54),
                  onPressed: () {
                    _bootcampLectureBox.add(
                      BootcampLecture(_lectureNameController.text,
                          _lectureDescriptionController.text, selectedDate),
                    );
                  },
                  child: const Text('Add lecture'),
                ),
              ),
              const SizedBox(height: 25),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('List of lectures', style: TextStyle(fontSize: 16)),
              ),
              const Divider(
                height: 3,
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: _bootcampLectureBox.listenable(),
                  builder: (context, Box<BootcampLecture> box, _) {
                    return ListView.separated(
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        final lecture = box.getAt(index);
                        return ListTile(
                          title: Text(
                              '${lecture!.name} ${lecture.date.day}/${lecture.date.month}/${lecture.date.year}'),
                          subtitle: Text(lecture.description),
                          trailing: IconButton(
                            onPressed: () {
                              box.deleteAt(index);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 3,
                          color: Colors.grey,
                        );
                      },
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
