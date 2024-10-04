import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventInputPage extends StatefulWidget {
  final DateTime selectedDate;

  const EventInputPage({super.key, required this.selectedDate});

  @override
  EventInputPageState createState() => EventInputPageState();
}

class EventInputPageState extends State<EventInputPage> {
  final ValueNotifier<String> _amPmNotifier = ValueNotifier('AM');

  @override
  void dispose() {
    _amPmNotifier.dispose();
    super.dispose();
  }
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _hourController = TextEditingController();
  final TextEditingController _minuteController = TextEditingController();
  // String _amPm = 'AM';
  final _formKey = GlobalKey<FormState>();

  bool _isValidTime(String hour, String minute) {
    if (hour.isEmpty || minute.isEmpty) return false;

    final int? h = int.tryParse(hour);
    final int? m = int.tryParse(minute);

    if (h == null || m == null) {
      return false;
    }

    return h >= 1 && h <= 12 && m >= 0 && m < 60;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Date: ${DateFormat.yMMMd().format(widget.selectedDate)}',style: const TextStyle(
                fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Event Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an event name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _hourController,
                      decoration: const InputDecoration(labelText: 'Hour (1-12)'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter hour';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _minuteController,
                      decoration: const InputDecoration(labelText: 'Minute (00-59)'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter minute';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
      Expanded(
        child: ValueListenableBuilder<String>(
          valueListenable: _amPmNotifier,
          builder: (context, value, child) {
            return DropdownButtonFormField<String>(
              value: value, // Bind the value from ValueNotifier
              decoration: const InputDecoration(labelText: 'AM/PM'),
              items: ['AM', 'PM'].map((label) {
                return DropdownMenuItem(
                  value: label,
                  child: Text(label),
                );
              }).toList(),
              onChanged: (newValue) {
                // Update the notifier value and state
                _amPmNotifier.value = newValue!;
              },
            );
          },
        ),
      ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _isValidTime(_hourController.text, _minuteController.text)) {
                    String formattedTime =
                        "${_hourController.text}:${_minuteController.text} ${_amPmNotifier.value}";

                    Navigator.pop(context, {
                      'name': _nameController.text,
                      'time': formattedTime,
                    });
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
