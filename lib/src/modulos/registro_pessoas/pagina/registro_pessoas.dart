import 'package:flutter/material.dart';
import 'package:my_money/src/shared/colors/app_colors.dart';
import 'package:my_money/src/shared/components/app_button.dart';
import 'package:my_money/src/shared/components/app_logo_title.dart';

class PaginaRegistroPessoas extends StatefulWidget {
  const PaginaRegistroPessoas({super.key});

  @override
  State<PaginaRegistroPessoas> createState() => _PaginaRegistroPessoasState();
}

class _PaginaRegistroPessoasState extends State<PaginaRegistroPessoas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appPageBackground,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
        
          ),
        ),
        backgroundColor: AppColors.appPageBackground,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 25,
                right: 25,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppLogoTitle(
                    title: 'Meus dados',
                    titleSize: 20,
                    iconSize: 80,                   
                  ),
                  TextFormField(
                    enabled: true,
                    textAlign: TextAlign.start,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text("Nome completo")),
                  ),
                                    TextFormField(
                    enabled: true,
                    textAlign: TextAlign.start,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text("Email")),
                  ),
                                    TextFormField(
                    enabled: true,
                    textAlign: TextAlign.start,
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Limite de gastos")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                  child: AppButton(action: () {} , label: "Enviar dados"),
                  )
                ],

              ),             
              ),
          )),
        ),

      );   
     }
    }