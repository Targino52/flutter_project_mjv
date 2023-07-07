import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_mjv/widgets/imc_result.dart';
import 'package:intl/intl.dart';

class ImcPage extends StatefulWidget {

  const ImcPage({ super.key });

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final pesoEditing = TextEditingController();
  final alturaEditing = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var imc = 0.0;

  Future<void> _calcularIMC ({required double peso, required double altura}) async {

    setState(() {
      imc = 0;
    });
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      imc = peso/ pow(altura, 2);
    });
  }

  @override
  void dispose() {
    pesoEditing.dispose();
    alturaEditing.dispose();

    super.dispose();
  }


   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(
            title: const Text('Calculadora IMC'),
            backgroundColor: Colors.blueGrey,
            ),
           body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    ImcResult(imc: imc),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: pesoEditing,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Peso'),
                      inputFormatters: [
                        CurrencyTextInputFormatter(
                          locale: 'pt_BR',
                          symbol: '',
                          turnOffGrouping: true,
                          decimalDigits: 2,
                        ),
                      ],
                      validator: (String?  value) {
                        if (value == null || value.isEmpty) {
                          return 'Peso Obrigatorio';
                        }
                      }
                    ),
                     TextFormField(
                      controller: alturaEditing,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Altura'),
                      inputFormatters: [
                        CurrencyTextInputFormatter(
                          locale: 'pt_BR',
                          symbol: '',
                          turnOffGrouping: true,
                          decimalDigits: 2,
                        ),
                      ],
                      validator: (String?  value) {
                        if (value == null || value.isEmpty) {
                          return 'Altura Obrigatoria';
                        }
                      }
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                    onPressed: (){

                      var formValid = formKey.currentState?.validate() ?? false;
                      
                      if (formValid){
                      var formatter = NumberFormat.simpleCurrency(
                        locale: 'pt_BR', decimalDigits: 2
                      );
              
                      double peso = formatter.parse(pesoEditing.text) as double;
                      double altura = formatter.parse(alturaEditing.text) as double;

                      _calcularIMC(peso: peso, altura: altura);
                      }
                    }, 
                    child: Text('Calcular IMC')
                    )
                  ],
                ),
              ),
            ),
           ),
       );
  }
}