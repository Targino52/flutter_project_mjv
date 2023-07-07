import 'package:flutter/material.dart';
import '../training/excesise.dart';


class ExerciseForm extends StatefulWidget {
  @override
  _ExerciseFormState createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  List<Exercise> _exercises = [];

  void addExercise(Exercise exercise) {
    setState(() {
      _exercises.add(exercise);
    });
  }

  void clearForm() {
    setState(() {
      _nameController.text = '';
      _descriptionController.text = '';
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Exercício'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Descrição',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final exercise = Exercise(
                  name: _nameController.text,
                  description: _descriptionController.text,
                );
                addExercise(exercise);
              },
              child: Text('Cadastrar'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Exercícios cadastrados:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: _exercises.length,
                itemBuilder: (context, index) {
                  final exercise = _exercises[index];
                  return ListTile(
                    title: Text(exercise.name),
                    subtitle: Text(exercise.description),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                clearForm();
              },
              child: const Text('Limpar Tela'),
            ),
          ],
        ),
      ),
    );
  }
}
