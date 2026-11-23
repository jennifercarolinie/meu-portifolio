import 'package:flutter/material.dart';

// Função principal do aplicativo.
// Todo aplicativo Flutter começa executando o main().
void main() {
  runApp(const MeuApp());
}

// Widget principal do aplicativo.
class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove a faixa "DEBUG" do canto da tela.
      debugShowCheckedModeBanner: false,

      // Nome do aplicativo.
      title: 'Projeto Flutter',

      // Tema geral do aplicativo.
      theme: ThemeData(
        // Define uma cor principal para o aplicativo.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
        ),

        // Ativa o padrão visual Material Design.
        useMaterial3: true,
      ),

      // Primeira tela aberta pelo aplicativo.
      home: const TelaLogin(),
    );
  }
}

// Tela de Login.
//
// Utilizamos StatefulWidget porque alguns elementos da tela
// podem mudar durante a execução.
//
// Exemplo:
// - mostrar/esconder senha;
// - validar campos;
// - alterar mensagens.
class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  // Chave utilizada para controlar e validar o formulário.
  final _formKey = GlobalKey<FormState>();

  // Controlador do campo de e-mail.
  // Permite pegar o que o usuário digitou.
  final TextEditingController _emailController =
      TextEditingController();

  // Controlador do campo de senha.
  final TextEditingController _senhaController =
      TextEditingController();

  // Controla se a senha ficará escondida ou visível.
  bool _senhaEscondida = true;

  // Função executada quando o usuário clicar em "Entrar".
  void fazerLogin() {
    // Verifica todas as validações dos campos.
    if (_formKey.currentState!.validate()) {
      // Retira o teclado da tela.
      FocusScope.of(context).unfocus();

      // Neste exemplo ainda não temos banco de dados.
      // Vamos apenas permitir o acesso após preencher
      // os campos corretamente.

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TelaInicial(
            emailUsuario: _emailController.text,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    // Libera os controladores quando a tela for encerrada.
    _emailController.dispose();
    _senhaController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // COR DO FUNDO DA TELA.
      //
      // Para trocar:
      // backgroundColor: Colors.red,
      //
      // ou usar hexadecimal:
      // backgroundColor: Color(0xFFF5F7FA),
      backgroundColor: const Color(0xFFF5F7FA),

      body: SafeArea(
        // SingleChildScrollView permite rolar a tela
        // caso o teclado ocupe muito espaço.
        child: SingleChildScrollView(
          child: Padding(
            // ESPAÇO NAS LATERAIS DA TELA.
            //
            // Altere 24 para aumentar ou diminuir.
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 30,
            ),

            child: Form(
              key: _formKey,

              child: Column(
                // Faz os elementos ocuparem a largura disponível.
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  // ESPAÇO NO TOPO DA TELA.
                  const SizedBox(height: 40),

                  // ÍCONE DO APLICATIVO.
                  Center(
                    child:Image.asset(
                      'assets/logo.png',
                      width: 120,
                      height: 120,
                      fit:BoxFit.contain,
                    ),
                  ),

                  // Espaço entre o ícone e o título.
                  const SizedBox(height: 20),

                  // TÍTULO.
                  const Text(
                    'Bem-vindo!',
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      // TAMANHO DO TEXTO.
                      fontSize: 30,

                      // TEXTO EM NEGRITO.
                      fontWeight: FontWeight.bold,

                      // COR DO TEXTO.
                      color: Color(0xFF1565C0),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // SUBTÍTULO.
                  const Text(
                    'Entre com seus dados para continuar',
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  // Espaço antes do formulário.
                  const SizedBox(height: 40),

                  // -----------------------------
                  // CAMPO DE E-MAIL
                  // -----------------------------
                  TextFormField(
                    controller: _emailController,

                    // Define o tipo de teclado.
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      // Nome apresentado no campo.
                      labelText: 'E-mail',

                      // Texto de exemplo.
                      hintText: 'exemplo@email.com',

                      // Ícone antes do texto.
                      prefixIcon: const Icon(Icons.email),

                      // Fundo do campo.
                      filled: true,
                      fillColor: Colors.white,

                      // BORDA NORMAL.
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),

                      // BORDA QUANDO O CAMPO ESTIVER SELECIONADO.
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),

                        borderSide: const BorderSide(
                          color: Color(0xFF1565C0),
                          width: 2,
                        ),
                      ),
                    ),

                    // Validação do campo.
                    validator: (valor) {
                      // Verifica se está vazio.
                      if (valor == null || valor.isEmpty) {
                        return 'Digite seu e-mail';
                      }

                      // Verificação simples de e-mail.
                      if (!valor.contains('@')) {
                        return 'Digite um e-mail válido';
                      }

                      // null significa que está correto.
                      return null;
                    },
                  ),

                  // ESPAÇO ENTRE OS CAMPOS.
                  const SizedBox(height: 20),

                  // -----------------------------
                  // CAMPO DE SENHA
                  // -----------------------------
                  TextFormField(
                    controller: _senhaController,

                    // Esconde os caracteres da senha.
                    obscureText: _senhaEscondida,

                    decoration: InputDecoration(
                      labelText: 'Senha',
                      hintText: 'Digite sua senha',

                      prefixIcon: const Icon(Icons.lock),

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),

                        borderSide: const BorderSide(
                          color: Color(0xFF1565C0),
                          width: 2,
                        ),
                      ),

                      // Botão que mostra ou esconde a senha.
                      suffixIcon: IconButton(
                        icon: Icon(
                          _senhaEscondida
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),

                        onPressed: () {
                          // setState informa ao Flutter que
                          // alguma informação da tela mudou.
                          setState(() {
                            _senhaEscondida = !_senhaEscondida;
                          });
                        },
                      ),
                    ),

                    validator: (valor) {
                      if (valor == null || valor.isEmpty) {
                        return 'Digite sua senha';
                      }

                      if (valor.length < 4) {
                        return 'A senha precisa ter pelo menos 4 caracteres';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 12),

                  // BOTÃO "ESQUECI MINHA SENHA".
                  Align(
                    // Coloca o botão no lado direito.
                    alignment: Alignment.centerRight,

                    child: TextButton(
                      onPressed: () {
                        // Neste momento apenas mostramos uma mensagem.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Recuperação de senha ainda não disponível.',
                            ),
                          ),
                        );
                      },

                      child: const Text(
                        'Esqueci minha senha',
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // -----------------------------
                  // BOTÃO ENTRAR
                  // -----------------------------
                  SizedBox(
                    // ALTURA DO BOTÃO.
                    height: 55,

                    // Como o Column possui stretch,
                    // o botão ocupará praticamente toda a largura.
                    child: ElevatedButton(
                      // Função executada ao clicar.
                      onPressed: fazerLogin,

                      // ESTILO DO BOTÃO.
                      style: ElevatedButton.styleFrom(
                        // COR DE FUNDO.
                        backgroundColor:
                            const Color(0xFF1565C0),

                        // COR DO TEXTO.
                        foregroundColor: Colors.white,

                        // BORDAS ARREDONDADAS.
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                      ),

                      child: const Text(
                        'ENTRAR',

                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // LINHA COM TEXTO E BOTÃO DE CADASTRO.
                  Row(
                    // Centraliza os elementos da Row.
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      const Text(
                        'Ainda não possui conta?',
                      ),

                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Tela de cadastro será desenvolvida depois.',
                              ),
                            ),
                          );
                        },

                        child: const Text(
                          'Cadastre-se',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// -------------------------------------------------------
// SEGUNDA TELA
// -------------------------------------------------------
//
// Esta tela aparece depois que o login for realizado.
// -------------------------------------------------------
// SEGUNDA TELA - PÁGINA INICIAL DO APLICATIVO
// -------------------------------------------------------

class TelaInicial extends StatelessWidget {

  // Recebe o e-mail digitado na tela de login.
  final String emailUsuario;

  const TelaInicial({
    super.key,
    required this.emailUsuario,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // Cor de fundo geral do aplicativo.
      backgroundColor: const Color(0xFFF5F7FA),

      // -------------------------------------------------
      // BARRA SUPERIOR
      // -------------------------------------------------
      appBar: AppBar(

        // Remove automaticamente o botão de voltar.
        // Assim a tela fica com aparência de página inicial.
        automaticallyImplyLeading: false,

        backgroundColor: const Color(0xFF1565C0),

        foregroundColor: Colors.white,

        elevation: 0,

        title: const Text(
          'Página inicial',

          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        // Botões do lado direito da barra.
        actions: [

          // Botão de notificações.
          IconButton(
            onPressed: () {
              // Vamos programar depois.
            },
            icon: const Icon(
              Icons.notifications_none,
            ),
          ),

          // Botão de perfil.
          IconButton(
            onPressed: () {
              // Vamos programar depois.
            },
            icon: const Icon(
              Icons.account_circle_outlined,
            ),
          ),

          const SizedBox(width: 8),
        ],
      ),

      // -------------------------------------------------
      // CONTEÚDO DA TELA
      // -------------------------------------------------
      body: SingleChildScrollView(

        child: Padding(

          padding: const EdgeInsets.all(20),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // -----------------------------------------
              // MENSAGEM DE BOAS-VINDAS
              // -----------------------------------------

              const Text(
                'Olá! 👋',

                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF202124),
                ),
              ),

              const SizedBox(height: 5),

              // Mostra o e-mail utilizado no login.
              Text(
                emailUsuario,

                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 25),

              // -----------------------------------------
              // CARD PRINCIPAL
              // Inspirado no bloco grande do wireframe
              // -----------------------------------------

              Container(

                width: double.infinity,

                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(

                  // Cor principal do aplicativo.
                  color: const Color(0xFF1565C0),

                  // Arredondamento do card.
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Row(

                  children: [

                    // Ícone do card.
                    Container(
                      width: 65,
                      height: 65,

                      decoration: BoxDecoration(
                        color: Colors.white24,
                        shape: BoxShape.circle,
                      ),

                      child: Icon(
                        Icons.apps,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),

                    SizedBox(width: 18),

                    // Texto ao lado do ícone.
                    Expanded(
                      child: Column(

                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Text(
                            'Bem-vindo ao aplicativo!',

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 6),

                          Text(
                            'Escolha uma das opções abaixo para começar.',

                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // -----------------------------------------
              // TÍTULO DA ÁREA DE OPÇÕES
              // -----------------------------------------

              const Text(
                'Acesso rápido',

                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // -----------------------------------------
              // PRIMEIRA OPÇÃO
              // -----------------------------------------

              _criarOpcao(
                icone: Icons.search,
                titulo: 'Consultar',
                descricao: 'Consulte informações disponíveis',
                aoClicar: () {
                  // Programaremos esta função depois.
                },
              ),

              const SizedBox(height: 12),

              // -----------------------------------------
              // SEGUNDA OPÇÃO
              // -----------------------------------------

              _criarOpcao(
                icone: Icons.list_alt,
                titulo: 'Meus registros',
                descricao: 'Veja seus registros recentes',
                aoClicar: () {
                  // Programaremos esta função depois.
                },
              ),

              const SizedBox(height: 12),

              // -----------------------------------------
              // TERCEIRA OPÇÃO
              // -----------------------------------------

              _criarOpcao(
                icone: Icons.favorite_border,
                titulo: 'Favoritos',
                descricao: 'Acesse seus itens favoritos',
                aoClicar: () {
                  // Programaremos esta função depois.
                },
              ),

              const SizedBox(height: 12),

              // -----------------------------------------
              // QUARTA OPÇÃO
              // -----------------------------------------

              _criarOpcao(
                icone: Icons.settings_outlined,
                titulo: 'Configurações',
                descricao: 'Preferências do aplicativo',
                aoClicar: () {
                  // Programaremos esta função depois.
                },
              ),

              // Espaço no final.
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // -------------------------------------------------
      // MENU INFERIOR
      // -------------------------------------------------
      // Os botões aparecem, mas ainda não mudam de tela.
      // Vamos programar a navegação futuramente.

      bottomNavigationBar: NavigationBar(

        // Página inicial selecionada.
        selectedIndex: 0,

        // Cor do indicador da opção selecionada.
        indicatorColor: const Color(0xFFD6E8FF),

        // Ações do menu.
        destinations: const [

          // HOME
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Início',
          ),

          // BUSCAR
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),

          // FAVORITOS
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),

          // PERFIL
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }


  // ---------------------------------------------------
  // FUNÇÃO PARA CRIAR OS CARDS DA LISTA
  // ---------------------------------------------------
  //
  // Em vez de repetir todo o código para cada opção,
  // criamos uma função que monta o card.
  //
  // Depois podemos reutilizá-la várias vezes.

  Widget _criarOpcao({

    // Ícone que aparecerá na esquerda.
    required IconData icone,

    // Nome da opção.
    required String titulo,

    // Pequena descrição.
    required String descricao,

    // Função executada ao clicar.
    required VoidCallback aoClicar,

  }) {

    return Material(

      color: Colors.white,

      // Borda arredondada.
      borderRadius: BorderRadius.circular(16),

      child: InkWell(

        // Função executada ao clicar.
        onTap: aoClicar,

        // Efeito de clique também arredondado.
        borderRadius: BorderRadius.circular(16),

        child: Container(

          padding: const EdgeInsets.all(16),

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(16),

            // Borda suave.
            border: Border.all(
              color: const Color(0xFFE3E7ED),
            ),
          ),

          child: Row(

            children: [

              // -----------------------------------------
              // ÍCONE
              // -----------------------------------------

              Container(

                width: 52,
                height: 52,

                decoration: BoxDecoration(

                  // Azul bem claro.
                  color: const Color(0xFFE3F2FD),

                  borderRadius: BorderRadius.circular(14),
                ),

                child: Icon(
                  icone,

                  color: const Color(0xFF1565C0),

                  size: 27,
                ),
              ),

              const SizedBox(width: 15),

              // -----------------------------------------
              // TEXTOS
              // -----------------------------------------

              Expanded(

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      titulo,

                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      descricao,

                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              // -----------------------------------------
              // SETA DA DIREITA
              // -----------------------------------------

              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
