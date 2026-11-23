<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Avaliação - Versionamento de Código</title>

    <style>
        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            margin: 0;
            padding: 20px;
            background: #0f172a;
            color: white;
        }

        .container {
            max-width: 950px;
            margin: auto;
            background: #1e293b;
            padding: 25px;
            border-radius: 15px;
        }

        h1 {
            text-align: center;
            margin-bottom: 10px;
        }

        .timer {
            text-align: right;
            font-size: 20px;
            font-weight: bold;
            color: #a855f7;
            margin-bottom: 20px;
        }

        .dados-aluno {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
        }

        .dados-aluno input {
            flex: 1;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #475569;
            background: #0f172a;
            color: white;
        }

        .questao {
            background: #0f172a;
            padding: 20px;
            border-radius: 12px;
            margin: 15px 0;
            border-left: 4px solid #a855f7;
        }

        .questao h3 {
            margin-top: 10px;
        }

        .tag {
            background: #334155;
            padding: 5px 10px;
            border-radius: 6px;
            font-size: 13px;
        }

        .opcao {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 12px;
            margin: 6px 0;
            background: #1e293b;
            border-radius: 8px;
            cursor: pointer;
        }

        .opcao:hover {
            background: #334155;
        }

        textarea {
            width: 100%;
            min-height: 120px;
            resize: vertical;
            background: #1e293b;
            color: white;
            border: 1px solid #475569;
            border-radius: 8px;
            padding: 12px;
        }

        button {
            background: #a855f7;
            color: white;
            border: none;
            padding: 14px 22px;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin: 10px 5px 0 0;
        }

        button:hover {
            opacity: 0.85;
        }

        .secundario {
            background: #334155;
        }

        .resultado {
            display: none;
        }

        .placar {
            text-align: center;
            font-size: 25px;
            margin: 25px 0;
        }

        .acerto {
            color: #22c55e;
        }

        .erro {
            color: #ef4444;
        }

        .feedback {
            padding: 10px;
            margin: 5px 0;
            border-radius: 8px;
        }

        .feedback.certo {
            background: rgba(34, 197, 94, 0.2);
            border-left: 4px solid #22c55e;
        }

        .feedback.errado {
            background: rgba(239, 68, 68, 0.2);
            border-left: 4px solid #ef4444;
        }

        @media (max-width: 600px) {
            .dados-aluno {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>

    <div class="container">

        <h1>📦 Avaliação - Versionamento de Código e Mensageria</h1>

        <div class="timer">
            Tempo: <span id="tempo">90:00</span>
        </div>

        <form id="formAvaliacao">

            <div class="dados-aluno">
                <input type="text" name="nome" placeholder="Nome do Aluno" required>

                <input type="text" name="turma" placeholder="Turma: 2A" required>
            </div>

            <div id="questoes-objetivas"></div>

            <!-- QUESTÃO 33 -->

            <div class="questao">

                <h3>
                    33. Explique como funciona o fluxo
                    Branch → Merge → Conflito e como resolvemos no laboratório.
                </h3>

                <textarea name="q33" required></textarea>

            </div>

            <!-- QUESTÃO 34 -->

            <div class="questao">

                <h3>
                    34. Explique a diferença entre Fila e Tópico
                    no RabbitMQ e cite 1 exemplo de uso de cada um.
                </h3>

                <textarea name="q34" required></textarea>

            </div>

            <button type="submit">
                Enviar e Gerar Relatório
            </button>

        </form>


        <!-- RESULTADO -->

        <div class="resultado" id="resultado">

            <h2>✅ Avaliação Enviada</h2>

            <div class="placar" id="placar"></div>

            <button onclick="exportarCSV()">
                📥 Baixar CSV da Turma
            </button>

            <button class="secundario" onclick="location.reload()">
                Nova Avaliação
            </button>

            <div id="feedback-geral"></div>

        </div>

    </div>


    <script>

        // ==========================================
        // QUESTÕES DA AVALIAÇÃO
        // ==========================================

        const questoes = [

            // BLOCO 1 - GIT BÁSICO

            {
                q: "Qual comando inicializa um repositório Git vazio?",
                op: [
                    "git start",
                    "git init",
                    "git new",
                    "git create"
                ],
                r: 1,
                tag: "Git"
            },

            {
                q: "Para que serve git add .?",
                op: [
                    "Fazer commit",
                    "Adicionar todos os arquivos modificados para o Stage",
                    "Ver status",
                    "Clonar repositório"
                ],
                r: 1,
                tag: "Git"
            },

            {
                q: "O que git commit -m 'mensagem' faz?",
                op: [
                    "Salva as alterações do Stage no histórico",
                    "Envia para o GitHub",
                    "Cria uma branch",
                q: "O que o arquivo .gitignore faz?",
                op: [
                    "Ignora commits",
                    "Define arquivos e pastas que o Git deve ignorar",
                    "Apaga arquivos",
                    "Cria backup"
                ],
                r: 1,
                tag: "Git"
            },


            // BLOCO 2 - BRANCH, MERGE E CONFLITO

            {
                q: "O que é um Conflito de Merge?",
            // BLOCO 3 - COMMITS

            {
                    "Padroniza o histórico e facilita gerar changelog",
                    "Apaga commits antigos",
                    "Faz merge sozinho"
                ],
                r: 1,
                tag: "Commits"
            },

            {
                q: "Exemplo de commit correto:",
                op: [
                    "update",
                    "arrumei o bug",
                    "fix: corrige calculo de dosagem",
                    "commit 1"
                ],
                r: 2,
                tag: "Commits"
            },

            {
                q: "O que é refactor:?",
                op: [
                    "Nova feature",
                    "Correção",
                    "Reestruturação do código sem mudar a funcionalidade",
                    "Deletar código"
                ],
                r: 2,
                tag: "Commits"
            },

            {
                q: "O que é chore:?",
                op: [
                    "Tarefa de manutenção, build ou dependências",
                    "Bug",
                    "Feature",
                    "Documentação"
                ],
                r: 0,
                tag: "Commits"
            },

            {
                q: "No nosso lab de Relatório de Incidente, qual foi o último commit?",
                op: [
                    "feat: implementa",
                    "update: ajuste",
                    "delete: remove",
                    "fix: reverte alterações incorretas e restaura layout"
                ],
                r: 3,
                tag: "Commits"
            },


            // BLOCO 4 - MENSAGERIA E RABBITMQ

            {
                q: "O que é um Tópico ou Exchange do tipo topic?",
                op: [
                    "1 para 1",
                    "1 para N, roteia mensagem por padrão",
                    "Apaga mensagem",
                    "Cria branch"
                ],
                r: 1,
                tag: "Mensageria"
            },

            {
                q: "Exemplo de uso de Fila:",
                op: [
                    "Chat em tempo real",
                    "Envio de email de boas-vindas após cadastro",
                    "Video chamada",
                    "Banco de dados"
                ],
                r: 1,
                tag: "Mensageria"
            },

            {
                q: "Exemplo de uso de Tópico:",
                op: [
                    "Processar pagamento",
                    "Notificar todos os serviços sobre novo_pedido",
                    "Salvar no banco",
                    "Fazer backup"
                ],
                r: 1,
                tag: "Mensageria"
            }

        ];


        // ==========================================
        // CRIAR QUESTÕES NA PÁGINA
        // ==========================================

        const divQuestoes =
            document.getElementById("questoes-objetivas");

        questoes.forEach((questao, i) => {

            let html = `
                <div class="questao">

                    <span class="tag">
                        ${questao.tag}
                    </span>

                    <h3>
                        ${i + 1}. ${questao.q}
                    </h3>
            `;

            questao.op.forEach((op, j) => {

                html += `
                    <label class="opcao">

                        <input
                            type="radio"
                            name="q${i}"
                            value="${j}"
                            required
                        >

                        ${op}

                    </label>
                `;

            });

            html += `</div>`;

            divQuestoes.innerHTML += html;

        });


        // ==========================================
        // CRONÔMETRO
        // ==========================================

        let tempo = 90 * 60;

        const intervalo = setInterval(() => {

            if (tempo > 0) {

                tempo--;

                let minutos = Math.floor(tempo / 60);
                let segundos = tempo % 60;

                document.getElementById("tempo").textContent =
                    `${String(minutos).padStart(2, "0")}:${String(segundos).padStart(2, "0")}`;

            } else {

                clearInterval(intervalo);

                alert("⏰ O tempo acabou!");

                document.getElementById("formAvaliacao").requestSubmit();

            }

        }, 1000);


        // ==========================================
        // BANCO DE DADOS LOCAL
        // ==========================================

        let bancoDeNotas =
            JSON.parse(
                localStorage.getItem("notasVersionamento")
            ) || [];


        // ==========================================
        // ENVIAR AVALIAÇÃO
        // ==========================================

        document
            .getElementById("formAvaliacao")
            .addEventListener("submit", function (e) {

                e.preventDefault();

                clearInterval(intervalo);

                const dados = new FormData(e.target);

                let acertos = 0;

                let feedback = "";

                let respostas = [];


                // Corrigir questões

                questoes.forEach((questao, i) => {

                    let resposta =
                        parseInt(dados.get("q" + i));

                    respostas.push(
                        questao.op[resposta] || "Em branco"
                    );


                    if (resposta === questao.r) {

                        acertos++;

                        feedback += `
                            <div class="feedback certo">

                                Q${i + 1}:
                                ✅ Acertou
                                [${questao.tag}]

                            </div>
                        `;

                    } else {

                        feedback += `
                            <div class="feedback errado">

                                Q${i + 1}:
                                ❌ Errou
                                [${questao.tag}]

                                <br>

                                Resposta certa:
                                <strong>
                                    ${questao.op[questao.r]}
                                </strong>

                            </div>
                        `;

                    }

                });


                // Calcular nota

                let nota =
                    ((acertos / questoes.length) * 10)
                    .toFixed(1);


                let tempoGasto =
                    90 * 60 - tempo;


                // Dados do aluno

                const aluno = {

                    data:
                        new Date()
                        .toLocaleString("pt-BR"),

                    nome:
                        dados.get("nome"),

                    turma:
                        dados.get("turma"),

                    nota:
                        nota,

                    acertos:
                        acertos,

                    tempo:
                        `${Math.floor(tempoGasto / 60)}m ${tempoGasto % 60}s`,

                    ...Object.fromEntries(

                        respostas.map(
                            (r, i) => [`Q${i + 1}`, r]
                        )

                    ),

                    D33:
                        dados.get("q33"),

                    D34:
                        dados.get("q34")

                };


                // Salvar no navegador

                bancoDeNotas.push(aluno);

                localStorage.setItem(
                    "notasVersionamento",
                    JSON.stringify(bancoDeNotas)
                );


                // Esconder formulário

                document
                    .getElementById("formAvaliacao")
                    .style.display = "none";


                // Mostrar resultado

                document
                    .getElementById("resultado")
                    .style.display = "block";


                document
                    .getElementById("placar")
                    .innerHTML = `

                        Aluno:
                        <strong>${aluno.nome}</strong>

                        <br><br>

                        Nota:
                        <span class="acerto">
                            ${nota}
                        </span>
                        / 10.0

                        <br>

                        Acertos:
                        ${acertos}/${questoes.length}

                    `;


                document
                    .getElementById("feedback-geral")
                    .innerHTML = feedback;

            });


        // ==========================================
        // EXPORTAR CSV
        // ==========================================

        function exportarCSV() {

            if (bancoDeNotas.length === 0) {

                alert(
                    "Nenhuma avaliação salva ainda!"
                );

                return;

            }


            let headers = [

                "Data",
                "Nome",
                "Turma",
                "Nota",
                "Acertos",
                "Tempo"

            ];


            questoes.forEach((_, i) => {

                headers.push(`Q${i + 1}`);

            });


            headers.push("D33");

            headers.push("D34");


            let csv = [
                headers.join(";")
            ];


            bancoDeNotas.forEach(aluno => {

                let linha = headers.map(h => {

                    let valor =
                        aluno[h] || "";

                    valor =
                        String(valor)
                        .replace(/"/g, '""');

                    return `"${valor}"`;

                });


                csv.push(
                    linha.join(";")
                );

            });


            const blob = new Blob(
                [csv.join("\n")],
                {
                    type:
                        "text/csv;charset=utf-8;"
                }
            );


            const url =
                URL.createObjectURL(blob);


            const link =
                document.createElement("a");


            link.href = url;


            link.download =
                "Notas_Versionamento.csv";


            document.body.appendChild(link);


            link.click();


            document.body.removeChild(link);


            URL.revokeObjectURL(url);

        }

    </script>

</body>

</html>
