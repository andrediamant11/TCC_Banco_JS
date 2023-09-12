const botoes1 = document.querySelectorAll(".comprar1");
const botoes2 = document.querySelectorAll(".comprar2");
const botoes3 = document.querySelectorAll(".comprar3");
const botoes4 = document.querySelectorAll(".comprar4");

function fazerRequisicaoParaLocalhost(sabor_id) {
  fetch(`http://localhost/conexao.php?sabor_id=${sabor_id}`)
    .then((response) => {
      if (!response.ok) {
        throw new Error(`Erro na requisição: ${response.statusText}`);
      }
      // Lide com a resposta aqui, se necessário
    })
    .catch((error) => {
      console.error("Erro na requisição:", error);
    });
}

botoes1.forEach((botao1) => {
  botao1.addEventListener("click", () => {
    fazerRequisicaoParaLocalhost(1);
    window.open("https://google.com");
  });
});

botoes2.forEach((botao2) => {
  botao2.addEventListener("click", () => {
    fazerRequisicaoParaLocalhost(2);
    window.open("http://www.169.254.11.72/bomba");
  });
});

botoes3.forEach((botao3) => {
  botao3.addEventListener("click", () => {
    fazerRequisicaoParaLocalhost(3);
    window.open("http://www.169.254.11.72/bomba");
  });
});

botoes4.forEach((botao4) => {
  botao4.addEventListener("click", () => {
    fazerRequisicaoParaLocalhost(4);
    window.open("http://www.169.254.11.72/bomba");
  });
});

google.charts.load("current", { packages: ["corechart"] });

// Chame a função de desenho do gráfico após o carregamento da biblioteca
google.charts.setOnLoadCallback(montarGraficoComDados);

function fazerRequisicaoParaTabela() {
  fetch("http://localhost/tabela.php")
    .then((response) => {
      if (!response.ok) {
        throw new Error(`Erro na requisição: ${response.statusText}`);
      }
      return response.json(); // Analisar a resposta como JSON
    })
    .then((jsonData) => {
      montarGraficoComDados(jsonData); // Chame a função para montar o gráfico
    })
    .catch((error) => {
      console.error("Erro na requisição:", error);
    });
}

function montarGraficoComDados(dataObj) {
  // Verifique se dataObj é um objeto JSON válido
  if (!Array.isArray(dataObj)) {
    console.error("Dados inválidos para o gráfico.");
    return;
  }

  // Crie um objeto de dados para o gráfico
  var data = new google.visualization.DataTable();
  data.addColumn("string", "Sabor");
  data.addColumn("number", "Quantidade");

  // Adicione cada conjunto de dados ao objeto DataTable
  dataObj.forEach((item) => {
    data.addRow([item.nome, parseInt(item.quantidade)]);
  });

  // Configure as opções do gráfico
  var options = {
    title: "Sucos do Momento",
  };

  // Crie uma instância do tipo de gráfico que deseja
  var chart = new google.visualization.PieChart(
    document.getElementById("grafico")
  );

  // Desenhe o gráfico com os dados e opções definidos
  chart.draw(data, options);
}

// Carregue a biblioteca do Google Charts e faça a requisição para obter os dados
google.charts.load("current", { packages: ["corechart"] });
google.charts.setOnLoadCallback(fazerRequisicaoParaTabela);
