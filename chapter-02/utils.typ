// Aplica o método de Briot–Ruffini (divisão sintética)
// dividend: coeficientes do polinômio (ordem decrescente)
// r: raiz candidata
// Retorna: (coeficientes do quociente, resto)
#let briot-ruffini(dividend, r) = [
  // Número de coeficientes do polinômio
  #let n = dividend.len()

  // Inicializa o quociente com o primeiro coeficiente
  #let quotient = (dividend.at(0),)

  // Calcula iterativamente os coeficientes do quociente
  #for i in range(1, n - 1) {
    quotient.push(quotient.at(i - 1) * r + dividend.at(i))
  }

  // Calcula o resto da divisão
  #let remainder = quotient.last() * r + dividend.last()

  // Retorna quociente e resto
  #return (quotient, remainder)
]

// Gera a tabela do método de Briot–Ruffini
// com formatação visual do processo
#let briot-ruffini-table(dividend, r) = [
  // Número de coeficientes
  #let n = dividend.len()

  // Executa o algoritmo de Briot–Ruffini
  #let (quotient, remainder) = briot-ruffini(dividend, r)

  // Define o estilo das linhas da tabela
  #set table(
    stroke: (x, y) => (
      top: if y == 1 { 1pt } else {},
      left: if (x == 1 or x == n) { 1pt } else {} 
    )
  )

  // Monta a tabela com coeficientes, quociente e resto
  #align(center, table(
    columns: n + 1,
    [$#r$], ..dividend.map(a => $#a$),
    [], ..quotient.map(q => $#q$), [$#remainder$]
  ))
]



// -------------------------------------------------------------
// 
// Função: fmt(x, digits)
// Formata um número no padrão brasileiro:
// - Arredonda para 'digits' casas decimais
// - Usa vírgula como separador decimal
// - Usa ponto como separador de milhar na parte inteira
// -------------------------------------------------------------
#let fmt(x, digits: 1, sci: false) = [

  // ==============================
  // NOTAÇÃO CIENTÍFICA
  // ==============================
  #if sci and x != 0 {
    let multiplier = calc.pow(10.0, digits)
    if sci==false {
      let result = calc.floor(number * multiplier) / multiplier
      return str(result).replace(".", ",")
    }

    let expoent = calc.floor(calc.ln(calc.abs(x)) / calc.ln(10))

    let coefficient = x / (calc.pow(10.0, expoent))

    //let rounded-coefficient = calc.round(coefficient * multiplier) / multiplier

    let rounded-coefficient = calc.round(coefficient, digits: digits)

    let coefficient-str = str(rounded-coefficient).replace(".", ",")

    if expoent == 0 {
      return $#coefficient-str$
    }


    let expoent-str = str(expoent).replace(".", ",")

    if coefficient == 1 {
      return $10^(#expoent-str)$
    }

    if coefficient == 10 {
      expoent-str = str(expoent+1).replace(".", ",")
      return $10^(#expoent-str)$
    }

    return $#coefficient-str times 10^(#expoent-str)$
  }

  // ==============================
  // FORMATAÇÃO NORMAL
  // ==============================
  #if digits == 0 {
    return str(calc.round(x))
  }

  // 1) Arredonda
  #let x = calc.round(x, digits: digits)

  // 2) Converte para string e troca "." por ","
  #let str_x = str(x).replace(".", ",")

  #if x == calc.round(x) {
    str_x += ",0"
  }

  // 3) Parte inteira e decimal
  #let (parte_inteira, parte_decimal) = str_x.split(",").flatten()

  // 4) Completa casas decimais
  #while parte_decimal.len() < digits {
    parte_decimal += "0"
  }

  // 5) Tamanho da parte inteira
  #let n = parte_inteira.len()

  // 6) Blocos de milhares
  #let m = calc.floor(n / 3)
  #let b = calc.rem(n, 3)

  // 7) Parte inicial
  #let str_parte_inteira = parte_inteira.slice(0, b)

  // 8) Grupos de 3
  #for i in range(m) {
    if b == 0 and i == 0 {
      str_parte_inteira += parte_inteira.slice(
        b + 3*i,
        b + 3*(i + 1)
      )
    } else {
      str_parte_inteira += "." + parte_inteira.slice(
        b + 3*i,
        b + 3*(i + 1)
      )
    }
  }

  // 9) Retorno final
  #return str_parte_inteira + "," + parte_decimal
]
