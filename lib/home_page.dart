import 'package:flutter/material.dart';
import 'package:flutter_project_mjv/page/excercise_form.dart';
import 'package:flutter_project_mjv/setState/imc_page.dart';

class HomePage extends StatelessWidget {

  const HomePage({ super.key });

  void _goToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>page,
      ),
    );
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           backgroundColor: Colors.grey[300],
           appBar: AppBar(title: const Text('Home Training'),),
           body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.sports_gymnastics,
                  size: 100
                ),

                const SizedBox(height: 50,),
                
                ElevatedButton(
                onPressed: () => _goToPage(context, ImcPage()),
                child: const Text('Calculo IMC'),
                ),
                const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () => _goToPage(context, ExerciseForm()), 
                child: const Text('Lista de Exercicios'),
                ),
              ],
            ),
           ),
       );
  }
}