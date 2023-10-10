class Calculadora {
  double _peso = 0.0;
  double _altura = 0.0;
  double _imc = 0.0;
  String _classe = "";
  String _mensagem = "";

  Calculadora(double peso, double altura) {
    setAltura(altura);
    setPeso(peso);
  }

  double getAltura() {
    return _altura;
  }

  double getPeso() {
    return _peso;
  }

  double getImc() {
    calcularIMC(_peso, _altura);
    return _imc;
  }

  String getClasse() {
    classificacao();
    return _classe;
  }

  String getMensagem() {
    classificacao();
    return _mensagem;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  double calcularIMC(double peso, double altura) {
    _imc = peso / (altura * altura);
    return _imc;
  }

  void classificacao() {
    if (getImc() < 16) {
      _classe = "Magreza grave";
      _mensagem =
          "Você está com ${getImc().toStringAsFixed(2)} de IMC, o que é considerado Magreza grave. É altamente recomendável procurar um médico para avaliação e orientação.";
    } else if (getImc() >= 16 && getImc() < 17) {
      _classe = "Magreza moderada";
      _mensagem =
          "Você está com ${getImc().toStringAsFixed(2)} de IMC, o que é classificado como Magreza moderada. É aconselhável buscar orientação médica e cuidar da sua saúde.";
    } else if (getImc() >= 17 && getImc() < 18.5) {
      _classe = "Magreza leve";
      _mensagem =
          "Seu IMC é de ${getImc().toStringAsFixed(2)}, indicando Magreza leve. É importante adotar uma alimentação equilibrada e hábitos saudáveis.";
    } else if (getImc() >= 18.5 && getImc() < 25) {
      _classe = "Saudável";
      _mensagem =
          "Seu IMC é de ${getImc().toStringAsFixed(2)}, o que é considerado Saudável. Continue mantendo um estilo de vida saudável para preservar sua saúde.";
    } else if (getImc() >= 25 && getImc() < 30) {
      _classe = "Sobrepeso";
      _mensagem =
          "Você tem um IMC de ${getImc().toStringAsFixed(2)}, indicando Sobrepeso. É aconselhável adotar medidas para reduzir o peso e melhorar a saúde.";
    } else if (getImc() >= 30 && getImc() < 35) {
      _classe = "Obesidade grau 1";
      _mensagem =
          "Seu IMC é de ${getImc().toStringAsFixed(2)}, o que indica Obesidade grau 1. Consulte um médico para avaliar e orientar um plano de controle de peso.";
    } else if (getImc() >= 35 && getImc() < 40) {
      _classe = "Obesidade grau 2";
      _mensagem =
          "Você tem um IMC de ${getImc().toStringAsFixed(2)}, classificado como Obesidade grau 2. Consulte um médico para avaliar opções de tratamento.";
    } else {
      _classe = "Obesidade Mórbida";
      _mensagem =
          "Seu IMC é de ${getImc().toStringAsFixed(2)}, indicando Obesidade Mórbida. É essencial procurar ajuda médica imediatamente para abordar essa condição de saúde crítica.";
    }
  }
}
