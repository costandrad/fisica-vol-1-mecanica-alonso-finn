#import "conf.typ": *
#import "utils.typ": *


#show: conf.with(
  author: [Igo da Costa Andrade],
  book: (
    title: "Física",
    subtitle: "um curso universitário. vol. 1 - Mecânica",
    year: 2014,
    press: "Blucher",
    address: "São Paulo",
    authors: (
      (
        name: "John R. Taylor",
        short-name: "Taylor, J. R.",
      ),
    ),
    chapter: (
      number: 2,
      title: "Medidas e unidades"
    )
  ),
)

#set heading(numbering: none)
== Problemas (pág. 43)

// Dados Gerais
#let uma              = 1.6604e-27 // Unidades de massa atômica em kg
#let h-ma-u = 1.00797 // Massa atômica do Hidrogênio em uma
#let o-ma-u = 15.9994 // Massa atômica do Oxigênio em uma
#let fe-ma-u = 55.847 // Massa atômica do Ferro em uma
#let rho-h2o-si = 1000 // No SI ou seja, em quilograma por metro cúbico 
#let rho-h2o = 1 // grama por centímetro cúbico    

// Massa atômica do nitrogênio
#let n-ma-u = 14.0067
// Densidade da água
#let rho-h2o = 1e3 // kg/m^3
// Densidades relativas
#let gamma-h2 = 8.988e-5
#let gamma-o2 = 1.42904e-3 
#let gamma-n2 = 1.25055e-3 
#let gamma-fe = 7.86
// Densidades absolutas em kg/m^3
#let rho-h2 = gamma-h2 * rho-h2o
#let rho-o2 = gamma-o2 * rho-h2o
#let rho-n2 = gamma-n2 * rho-h2o
#let rho-fe = gamma-fe * rho-h2o
// Massa molecular (mm) da cada gás em unidades de massa atômica
#let h2-mm-u = 2 * h-ma-u
#let o2-mm-u = 2 * o-ma-u
#let n2-mm-u = 2 * n-ma-u

// Massa molecular (mm) da cada gás em kg
#let h2-mm-kg = 2 * h-ma-u * uma
#let o2-mm-kg = 2 * o-ma-u * uma
#let n2-mm-kg = 2 * n-ma-u * uma
#let fe-ma-kg = fe-ma-u * uma

// Mass molecular da água em kg
#let h2o-mm-kg = (2 * h-ma-u + o-ma-u) * uma

+ As massas atômicas, representadas na Tab A.1, são expressas em _unidades de massa atômica_, abreviadas por $"u"$. $1 "u"$ é igual a $1,6604 times 10^(-27)$ kg. Calcule, em quilogramas e em gramas, as massas de

  #set enum(numbering: "(a)")
  + um átomo de hidrogênio e

    #let h-ma-kg = h-ma-u * uma
    #let h-ma-g = h-ma-kg * 1000


    #solution([
      Conforme dados da Tab. A.1, a massa do Hidrogênio em _unidades de massa atômica_ é igual a $#fmt(h-ma-u, digits: 5) "u"$
      $
        m_(H (k g)) = m_(H (u)) dot frac(#fmt(uma, digits: 4, sci: true) "kg", "1 u") = #fmt(h-ma-u, digits: 5, sci: true) "u" dot frac(#fmt(uma, digits: 4, sci: true) "kg", "1 u") approx #fmt(h-ma-kg, digits: 4, sci: true) "kg"\
        m_(H (g)) = m_(H (k g)) dot frac(1000 "g",1 "kg") = #fmt(h-ma-kg, digits: 4, sci: true) "kg" dot frac(1000 "g",1 "kg") = #fmt(h-ma-g, digits: 4, sci: true)  " g"
      $
      
    ])

  + um átomo de oxigênio

    #let o-ma-kg = o-ma-u * uma
    #let o-ma-g = o-ma-kg * 1000

    #solution([
      Conforme dados da Tab. A.1, a massa atômica do átomo de Oxigênio é igual a $#fmt(o-ma-u, digits: 4, sci: false) "u"$
      $
        m_(O (k g)) = m_(O (u)) dot frac(#fmt(uma, digits: 4, sci: true) "kg", 1 "u") = #fmt(o-ma-u, digits: 4, sci:false) "u" dot frac(#fmt(uma, digits: 5, sci: true) "kg", 1 "u") approx #fmt(o-ma-kg, digits: 4, sci: true) "kg" \
        m_(O (g)) = m_(O (k g)) dot frac(1000 "g", 1 "kg") = #fmt(o-ma-kg, digits: 4, sci: true) "kg" dot frac(1000 "g", 1 "kg") = #fmt(o-ma-g, digits: 4, sci: true) "g"
      $
    ])  

+ Quantas moléculas, cada uma composta por um átomo de oxigênio e dois átomos de hidrogênio, existem num grama de água? Quantas existem em 18 gramas? Quantas existem em um centímetro cúbico?
  #let h2o-ma-g = o-ma-g + 2 * h-ma-g
  #let n-h2o-1g = 1/h2o-ma-g
  #let n-h2o-18g = 18 * n-h2o-1g
  #let n-h2o-1cm3 = rho-h2o * 1 / h2o-ma-g

  #solution([
    Primeiramente, utilizamos o resultado do Prob. 2.1 (b) para calcular a massa de uma molécula de água (um átomo de oxigênio e dois átomos de hidrogênio) em gramas ($"g"$):

    $
      m_(H_2O (g)) = m_(O (g)) + 2 dot m_(H (g)) =  (#fmt(o-ma-g, digits: 4, sci: true) " g") + 2 dot (#fmt(h-ma-g, digits: 4, sci: true) " g")\
       m_(H_2O (g)) = #fmt(h2o-ma-g, digits: 4, sci: true) " g"
    $

    Portanto, em $1 "g"$ de água existem:
    $
      N_(1 g) = frac(1, #fmt(h2o-ma-g) " g") = #fmt(n-h2o-1g, digits: 4, sci: true) "moléculas de água por grama"
    $

    Em 18 gramas, teremos:
    $
      N_(18 g) = 18 dot N_(1 g) = 18 dot #fmt(n-h2o-1g, digits: 4, sci: true) "moléculas" \
      N_(18 g) approx #fmt(n-h2o-18g, digits: 2) "moléculas de água"
    $

    Finalmente, para determinar a quantidade de moléculas de água em 1 centímetro cúbico, necessitamos da densidade da água: $rho_(H_2O) = 1 "g/cm"^3$. Deforma geral, consideremos que num volume $V$ de água, temos a massa $m = N dot m_(H_2O(g))$ em que $N$ é a quantidade de moléculas presentes no volume $V$ e $m_(H_2O (g))$ é a massa de uma molécula de água em gramas, calculada acima. Assim,
    $
      N dot m_(H_2O(g)) = rho_(H_2_O) V &arrow.double N = frac(rho_(H_2_O) V, m_(H_2O(g))) = frac(#fmt(rho-h2o, digits: 0, sci: false) " g/cm"^3 dot 1 "cm"^3, #fmt(o-ma-g, digits: 4, sci: true) "g")\
      &arrow.double N = #fmt(n-h2o-1cm3, digits: 4, sci: true) "moléculas"
    $
    Obviamente, é o mesmo resultado encontrado na primeira parte deste problema.
     
  ])

+ Na Seç. 2.3 foi mencionado que o quilograma poderia ser definido como sendo igual à mass de $5,0188 times 10^(25)$ átomos do isótopo $attach("C", tl: 12)$, cuja massa é definida como sendo exatamentde $12,0000 " u"$. Verifique se essa definição é compatível com o valor de $"u"$ dado no Prob. 2.1.

  #let c-ma-u = 12.0000
  #let n-atomos-c = 5.0188e25
  #let u = 1/ (c-ma-u * n-atomos-c)
  \ \
  #solution([
    $
      m_("kg") = N dot m_("u")  arrow.double m_("u") = frac(m_("kg"), N) &arrow.double #fmt(c-ma-u, digits: 0, sci: false) "u" = frac(1 "kg", #fmt(n-atomos-c, digits: 4, sci: true))\
      &arrow.double 1 "u" = frac(1, #fmt(c-ma-u, digits: 0) dot #fmt(n-atomos-c, digits: 5, sci: true)) "kg"\
      &arrow.double 1 "u" = #fmt(u, digits: 4, sci: true) "kg"
    $
  ])

+ Considere as moléculas de hidrogênio, de oxigênio e de nitrogênio, cada uma delas composta por dois átomos idênticos. Calcule o número de moléculas de cada um desses gases, nas condições normais de pressão e temperatura (TPN) existentes em $1 " m"^3$. Use os valores das densidades relativas dadas na Tab. 2.2. Faça uma extensão do seu cálculo que seja válida para outros gases. Qual é a conclusão geral que você poderia tirar dos seus resultados?
  
  #solution([
    // Massa atômica do nitrogênio
    #let n-ma-u = 14.0067
    // Densidade da água
    #let rho-h2o = 1e3 // kg/m^3
    // Densidades relativas
    #let gamma-h2 = 8.988e-5
    #let gamma-o2 = 1.42904e-3 
    #let gamma-n2 = 1.25055e-3 
    // Densidades absolutas em kg/m^3
    #let rho-h2 = gamma-h2 * rho-h2o
    #let rho-o2 = gamma-o2 * rho-h2o
    #let rho-n2 = gamma-n2 * rho-h2o
    // Massa molecular (mm) da cada gás em unidades de massa atômica
    #let h2-mm-u = 2 * h-ma-u
    #let o2-mm-u = 2 * o-ma-u
    #let n2-mm-u = 2 * n-ma-u
    // Massa molecular (mm) de cada gás em kg
    #let h2-mm-kg = h2-mm-u * uma
    #let o2-mm-kg = o2-mm-u * uma
    #let n2-mm-kg = n2-mm-u * u
    // Volume (m^3)
    #let v = 1
    // Quantidade de moléculas em 1 metro cúbico
    #let n-h2 = (gamma-h2 * rho-h2o * v)/h2-mm-kg 
    #let n-o2 = (gamma-o2 * rho-h2o * v)/o2-mm-kg 
    #let n-n2 = (gamma-n2 * rho-h2o * v)/n2-mm-kg 

    De forma geral, seja $rho = gamma dot rho_(H_2O)$ a densidade absoluta de uma substância, cuja densidade relativa em relação à água ($H_2O$) é igual a $gamma$. Em um dado volume $V$, a massa dessa substância é:

    $
      M = rho dot V\ M = (gamma dot rho_(H_2O)) dot V
    $
    Por outro lado, sabendo que tal substância é composta por $N$ moléculas, cada uma com massa $m$, então,

    $
      M = (gamma dot rho_(H_2O)) dot V &arrow.double N dot m  = (gamma dot rho_(H_2O)) dot V\
      &arrow.double N = frac((gamma dot rho_(H_2O)) dot V, m)
    $ 

    Podemos aplicar a fórmula acima para determinar a quantidade de moléculas de cada gás presentes em um volume $V = 1 "m"^3$.
    - Hidrogênio

    A massa de cada molécula de Hidrogênio é:
    $
      m_(H_2) = 2 m_H = 2 dot (#fmt(h-ma-u, digits: 5) "u") = #fmt(h2-mm-u, digits: 5) "u"\
      m_(H_2) = #fmt(h2-mm-u, digits: 5) "u" dot frac(#fmt(u, digits: 4, sci: true), 1 " u") \
      m_(H_2) = #fmt(h2-mm-kg, sci: true) "kg"
    $

    Sabendo que a densidade relativa do Hidrogênio em relação à água ($rho_(H_2O) = #fmt(rho-h2o, sci: false, digits: 0) " kg/m"^3$) é $gamma_(H_2) = #fmt(gamma-h2, digits: 4, sci: true)$, então, quantidade de moléculas no volume $V = 1 " m"^3$ é igual a:
    $
      N_(H_2) = frac((gamma_(H_2) dot rho_(H_2O)) dot V, m_(H_2)) = frac((#fmt(gamma-h2, digits: 4, sci: true) dot #fmt(rho-h2o, digits: 0)) dot 1, #fmt(h2-mm-kg, sci: true)) = #fmt(n-h2, digits: 2, sci: true) " moléculas"
    $

  - Oxigênio

  A massa molecular do oxigênio é:
  $
    m_(O_2) = 2 dot m_O = 2 dot (#fmt(o-ma-u, sci: false, digits: 5) "u") = #fmt(o2-mm-u, sci: false) "u"\
    m_(O_2) = #fmt(o2-mm-u, sci: false) "u" dot frac(#fmt(u, digits: 4, sci: true), 1" u")\
    m_(O_2) = #fmt(o2-mm-kg, sci: true) "kg"
  $

  Sendo $gamma_(O_2) = #fmt(gamma-o2, digits: 6)$ a densidade relativa do oxigênio, então a quantidade de moéculas presentes em $1 "m"^3$ é:
  $
    N_(O_2) = frac((gamma_(O_2) dot rho_(H_2O)) dot V, m_(O_2)) = frac((#fmt(gamma-o2, digits: 6, sci: true) dot #fmt(rho-h2o, sci: false, digits: 0)) dot #fmt(v, digits: 0), #fmt(o2-mm-kg, sci: true)) = #fmt(n-o2, digits: 2, sci: true) "moléculas"
  $

  - Nitrogênio

  A massa molecular do nitrogênio é:
  $
    m_(N_2) = 2 dot m_N = 2 dot (#fmt(n-ma-u, sci: false, digits: 5) "u") = #fmt(n2-mm-u, sci: false) "u"\
    m_(N_2) = #fmt(n2-mm-u, sci: false) "u" dot frac(#fmt(u, digits: 4, sci: true), 1" u")\
    m_(N_2) = #fmt(n2-mm-kg, sci: true) "kg"
  $

  Sendo $gamma_(N_2) = #fmt(gamma-n2, digits: 6, sci: true)$ a densidade relativa do oxigênio, então a quantidade de moéculas presentes em $1 "m"^3$ é:
  $
    N_(N_2) = frac((gamma_(N_2) dot rho_(H_2O)) dot V, m_(N_2)) = frac((#fmt(gamma-n2, digits: 6, sci: true) dot #fmt(rho-h2o, sci: false, digits: 0)) dot #fmt(v, digits: 0), #fmt(n2-mm-kg, sci: true)) = #fmt(n-n2, digits: 2, sci: true) "moléculas"
  $

  Podemos concluir que a quantidade de moléculas em determinado volume independe do tipo de gás.
  ])

+ Admitindo-se que o ar é composto por 20% de oxigênio e 80% de nitrogênio, e que esses gases formam moléculas diatômicas, calcule a massa molecular "efetiva" do ar. Avalie o número de moléculas em $1 "cm"^3$ de ar nas condições TPN, Quantas moléculas são de oxigênio e quantas são de nitrogênio?

  #solution([
    // Massa atômica do nitrogênio
    #let n-ma-u = 14.0067
    #let ar-ma-u = 0.2 * 2 * o-ma-u + 0.8 * 2 * n-ma-u
    #let ar-ma-kg = ar-ma-u * u
    *Primeira parte:* Seja $N_(a r)$ a quantidade de moléculas de ar presentes em um dado volume $V$, Supondo que o ar é composto por $20%$ de oxigênio ($N_("O"_2) = 0,2 N_(a r)$) e $80%$ de nitrogênio ($N_("N"_2) = 0,8 N_(a r)$), temos:

    $ N_(a r )  = N_("O"_2) + N_("N"_2). $

    Por outro lado, a massa total de ar é:

    $
      M_(a r) = N_("O"_2) dot m_("O"_2) + N_("N"_2) dot m_("N"_2),
    $
    em que $m_("O"_2)$ e $m_("N"_2)$ são respecitvamente as massas moleculares do oxigênio e do nitrogênio. Portanto, a massa molecular efetiva do ar é:
    $
      m_(a r) = frac(M_(a r), N_(a r )) &= frac(N_("O"_2) dot m_("O"_2) + N_("N"_2) dot m_("N"_2), N_("O"_2) + N_("N"_2))\
        m_(a r) &= frac(N_("O"_2), N_( a r)) dot m_("O"_2) + frac(N_("N"_2), N_(a r)) dot m_("N"_2)\
        m_(a r)&= 0,2 dot m_("O"_2) + 0,8 dot m_("N"_2)\
        m_(a r) &= 0,2 dot (2 dot #fmt(o-ma-u, sci:false, digits:5)) + 0,8 dot (2 dot #fmt(n-ma-u, sci: false, digits:5)) = #fmt(ar-ma-u, sci:false, digits:5) frac("u", "molécula")\
        m_(a r) &= (#fmt(ar-ma-u, sci:false, digits:5) frac("u", "molécula")) dot (#fmt(u, digits:4, sci: true) "kg/u") = #fmt(ar-ma-kg, digits:3, sci: true) frac("kg", "molécula")
        &
    $ 

    *Segunda parte:* Seja $M_(a r) = M_("O"_2) + M_("N"_2)$ a massa total de ar em um volume $V$ em função da massa total de oxigênio ($M_("O"_2)$), que ocupa o volume $V_("O"_2) = 0,2 V$ e da massa total de nitrogênio, que ocupa o volume $V_("N"_2) = 0,8 V$. Então, 


    $
      M_(a r) = M_("O"_2) + M_("N"_2) &arrow.double M_(a r ) &=& rho_("O"_2) dot V_("O"_2) + rho_("N"_2) dot V_("N"_2)\
        &arrow.double M_(a r) &=& rho_("O"_2) dot (0,2 V) + rho_("N"_2) dot (0,8 V)\
        &arrow.double M_(a r) &=& (0,2 rho_("O"_2) + 0,8 rho_("N"_2)) dot V\
        &arrow.double N_(a r) dot m_(a r) &=& (0,2 rho_("O"_2) + 0,8 rho_("N"_2)) dot V\
        &arrow.double N_(a r)/V &=& frac(0","2 rho_("O"_2) + 0","8 rho_("N"_2) , m_(a r))
     $

     #let n-ar-1m3 = (0.2 * rho-o2 + 0.8 * rho-n2)/(ar-ma-kg)
     #let n-ar-1cm3 = n-ar-1m3 * 1e-6
     #let n-o2-1cm3 = 0.2 * n-ar-1cm3
     #let n-n2-1cm3 = 9.8 * n-ar-1cm3

     Para determinar a quantidade de moléculas de ar em $1 "cm"^3$:
     $
       N_(a r)/V &= frac(0","2 rho_("O"_2) + 0","8 rho_("N"_2) , m_(a r)) = frac(0","2 dot (#fmt(rho-o2) "kg"/"m"^3) + 0","8 dot (#fmt(rho-n2) "kg"/"m"^3) , #fmt(ar-ma-kg) frac("kg", "molécula")) \
        N_(a r)/V &= #fmt(n-ar-1m3, sci: true, digits: 2)  " moléculas"/"m"^3\
        N_(a r)/V &= #fmt(n-ar-1m3, sci: true, digits: 2)  "moléculas"/"m"^3 dot (frac( 1"m"^3, 10^6 "cm"^3))\
        N_(a r)/V &= #fmt(n-ar-1cm3, sci: true, digits: 2)  "moléculas"/"cm"^3
     $
    
    *Terceira parte*: Do total de moléculas de ar, temos:
      $
        N_("O"_2)/V = 0,2 dot N_(a r)/V = 0,2 dot #fmt(n-ar-1cm3, sci: true, digits: 2) " moléculas"/"cm"^3 = #fmt(n-o2-1cm3, sci: true, digits: 2) " " " moléculas"/"cm"^3\
        N_("N"_2)/V = 0,8 dot N_(a r)/V = 0,8 dot #fmt(n-ar-1cm3, sci: true, digits: 2) " moléculas"/"cm"^3 = #fmt(n-n2-1cm3, sci: true, digits: 2) " " " moléculas"/"cm"^3\
      $
  ])
  \ \ \ \ \ \ \ \ \
+ A densidade do gás interestelar na nossa galáxia é avaliada em cerca de $10^(-21) "kg" dot "m"^(-3)$. Admitindo-se que esse gás é constituído principalmente de hidrogênio, avalie o número de átomos de hidrogênio por $"cm"^3$. Compare esse resultado com o correspondente obtido para o ar nas condições TPN (Prob. 2.5).

  #solution([
    #let rho-gas = 1e-21
    #let n-gas-1m3 = rho-gas / h-ma-kg
    #let n-gas-1cm3 = n-gas-1m3 * 1e-6
    $
      rho_("H"_2) = M/V arrow.double frac(N dot m_("H"_2), V) arrow.double N/V = &frac(rho_("H"_2), m_("H"_2)) = frac(#fmt(rho-gas, sci: true) "kg"/"m"^3, #fmt(2 * h2-mm-kg, sci: true) "kg"/"molécula")\
      &frac(rho_("H"_2), m_("H"_2)) = #fmt(n-gas-1m3, sci: true, digits: 2) " moléculas/m"^3\
      &frac(rho_("H"_2), m_("H"_2)) = #fmt(n-gas-1m3, sci: true, digits: 2) " moléculas/m"^3 dot (frac( 1"m"^3, 10^6 "cm"^3))\
      &frac(rho_("H"_2), m_("H"_2)) = #fmt(n-gas-1cm3, sci:true, digits: 2) " moléculas/cm"^3
    $
  ])

+ Um copo de 2 cm de raio contém água. Em duas horas, o nível da água baixa 1mm. Avalie, em gramas por hora, a velocidade de evaporação da água. Quantas moléculas de água estão se evaporando por segundo em cada centímetro quadrado da superfície da água?

  #solution([
    #let rho-h2o-cgs = 1 // Densidade da água em g/cm^3
    #let r = 2 // raio em cm
    #let dhdt = .1/2 // taxa de evaporação em cm/h
    #let dmdt = rho-h2o-cgs * calc.pi * calc.pow(r, 2) * dhdt
    #let dNdt = (rho-h2o-cgs / (h2o-mm-kg * 1000)) * dhdt * (1/3600)

    Seja a taxa de evaporação $display(frac(d h, d t)) = display(frac(1 "mm", 2 "h")) = 0,5 "mm/h" = 0,5 "cm/h"$. Então,
    $
      rho = M/V &arrow.double M = rho dot V arrow.double M = rho dot (S h) arrow.double M = rho dot (pi r^2 h)\
      &arrow.double frac(d M, d t) = rho (pi r^2 dot frac(d h, d t))\
      &arrow.double frac(d M, d t) = (#fmt(rho-h2o-cgs) "g/cm"^3) dot (pi dot (#fmt(r) "cm")^2 dot (#fmt(dhdt, sci: false) "cm/h"))\
      &arrow.double frac(d M, d t) = #fmt(dmdt, sci: false) "g/h"
    $

    
    Seja a massa molecular da água: $m = 2 m_("H"_2) + m_("O"_2) = 2 dot (#fmt(h-ma-u * uma, sci: true) "kg") + (#fmt(o-ma-u * uma , sci: true) "kg") = #fmt(h2o-mm-kg, sci: true) "kg"$.

    Para determinarmos a quantidade de moléculas se evaporando por segundo em cada centímetro quadrado, façamos:
    $
      rho = M/V &arrow.double M = rho dot V arrow.double rho dot (S h)\
        &arrow.double N dot m = rho S h\
        &arrow.double frac(d N, d t) dot m = rho S dot frac(d h, d t)\
        &arrow.double 1/S dot frac(d N, d t) = frac(rho, m) dot frac(d h, d t)\
        &arrow.double 1/S dot frac(d N, d t) = frac(#fmt(rho-h2o-cgs, sci: false) " g/cm"^3, #fmt(h2o-mm-kg, sci: true, digits: 2) "kg" dot 1000 "g/kg") dot (#fmt(dhdt, sci:false) "cm"/"h")\
        &arrow.double 1/S dot frac(d N, d t) = frac(#fmt(rho-h2o-cgs, sci: false) " g/cm"^3, #fmt(h2o-mm-kg, sci: true, digits: 2) "kg" dot 1000 "g/kg") dot (#fmt(dhdt, sci:false) "cm"/"h")  dot (frac(1 " h", 3600 " s"))\
        &arrow.double 1/S dot frac(d N, d t) = #fmt(dNdt, digits: 2, sci: true) "cm/s"
    $


  ])

+ Um _mol_ de uma substância é definido como sendo uma quantidade dessa substância expressa em _gramas_, numericamente igual à massa molecular dessa substância em $"u"$. (Quando nos referemos a um elemento químico, e não a um composto, usaremos a massa atômoca em vez da massa molecular.) Verifique que o número de moléculas (ou átomos) em um mol de _qualquer_ substância é sempre o mesmo e é igual a $6,0225 times 10^(23)$. Esse número, chamado _constante de Avogadro_, é uma constante física muito importante.

  #solution([
    Consideremos uma substância, cuja massa molecular (ou atômica) em $"u"$ seja igual a $m_u$. Tomemos uma quantidade $m$ (em gramas) dessa referida substância, tal que $m$ é numericamente igual a $m_u$. A quantidade $N$ de _componentes_ (átomos ou moléculas) presentes na massa $m$ é tal que:

    #set text(size: 11pt)
    $
      m "grama" = N dot (m_u "u") &arrow.double N = frac(m "grama", m_u "u")  arrow.double N = frac(cancel(m) "grama", cancel(m)_u "u")\
        &arrow.double N = frac(1 "grama", cancel(1 "u") dot display(frac(#fmt(uma, digits:5, sci: true) "kg" , cancel(1 "u")))) = frac(1 "grama", #fmt(uma, digits:5, sci: true) cancel("kg") dot display(frac(10^3 "grama", 1 cancel("kg"))))\
        &arrow.double N = frac(1 cancel("grama"), #fmt(uma * 1e3, digits: 5, sci: true) cancel("grama")) = frac(1, #fmt(uma * 1e3, digits: 5, sci: true))\
        &arrow.double N = #fmt(1/(uma * 1e3), digits: 4, sci: true) "componentes"
    $
  ])


// Dados do problema
#let substancias = (
  ("Hidrogênio", h2-mm-kg, rho-h2),
  ("Água", h2o-mm-kg, rho-h2o),
  ("Ferro", fe-ma-kg, rho-fe)
)
#let cubic-model(m, d) = (
  calc.root(m/d, 3)
)
#let esphere-model(m,d) = (
  calc.root( (6*m)/(calc.pi * d), 3)
)

+ Usando os dados das Tabs 2.2 e A.1, avalie a separação média entre moléculas nas condições TPN, no hidrogênio (gás), na água (líquido) e no ferro (sólido).

  #solution([
    De forma geral, consideremos uma substância com densidade $rho$ e cuja massa molecular é $m$. Tomemos uma quantidade $N$ de moléculas  dessa substância, ocupando um volume total $V$. Então,
    $
      rho = (N dot m)/V
    $
    O volume médio $v$ ocupado por cada molécula  é 
    $
      v = V/N arrow.double v = m/rho
    $
    A fim de determinar a separação média entre as moléculas, temos dois modelos a considerar:
      #set enum(numbering: "1.") 
      + Modelo cúbico: cada molécula "ocupa" um espaço cúbico de volume $v$ e lado $l$.
        Nesse caso, a separação média entre as moléculas é igual ao lado do cubo. Ou seja,
        $
          v = m/rho arrow.double l^3 = m/rho arrow.double l = root(3, m/rho)
        $

      + Modelo esférico: cada molécula "ocupa" um espaço esférico de volume $v$ e diâmetro $d$.
        Nesse caso, a separação média entre as moléculas é igual ao diâmetro da esfera. Assim,
        $
          v = m/rho &arrow.double  (pi d^3)/6 = m/rho arrow.double d = root(3, (6m)/(pi rho))
        $



      A @tab-separacao-molecular mostra o resultado da aplicação dos dois modelos de cálculo da separação média entre moléculas para: #substancias.map(it => it.at(0)).join(", ").


      #set table(
        stroke: (x, y) => if y == 0 {
          (top: 0.7pt+black)
          (bottom: 0.7pt+black)
        } else {
          (bottom: 0.7pt+black)
        },
        align: center,
        fill: (x, y) => if y <=1 {
          gray.lighten(50%)
        } else if calc.even(y) {
          gray.lighten(85%)
        }
      )
      #figure(
        kind: table,
        caption: [Seperação média entre moléculas de diversas substâncias]
      )[#table(
        columns: 5,
        [], [], [], table.cell(colspan: 2)[Separação ($"m"$)],
        [Substância], [Massa Molecular ($"kg"$)], [Densidade ($"kg/m"^3$)], [Modelo Cúbico], [Modelo Esférico],
        [#substancias.at(0).at(0)], [$#fmt(substancias.at(0).at(1), digits:2, sci: true)$], [$#fmt(substancias.at(0).at(2), digits:2, sci: true)$], [#fmt(cubic-model(substancias.at(0).at(1), substancias.at(0).at(2)), digits:2, sci: true)], [#fmt(esphere-model(substancias.at(0).at(1), substancias.at(0).at(2)), digits:2, sci: true)],
        [#substancias.at(1).at(0)], [$#fmt(substancias.at(1).at(1), digits:2, sci: true)$], [$#fmt(substancias.at(1).at(2), sci:true)$], [#fmt(cubic-model(substancias.at(1).at(1), substancias.at(1).at(2)), digits:2, sci: true)], [#fmt(esphere-model(substancias.at(1).at(1), substancias.at(1).at(2)), digits:2, sci: true)],
        [#substancias.at(2).at(0)], [$#fmt(substancias.at(2).at(1), digits:2, sci: true)$], [$#fmt(substancias.at(2).at(2), digits:2)$], [#fmt(cubic-model(substancias.at(2).at(1), substancias.at(2).at(2)), digits:2, sci: true)], [#fmt(esphere-model(substancias.at(2).at(1), substancias.at(2).at(2)), digits:2, sci: true)],
      )]<tab-separacao-molecular>
  ])


// Dados do problema
#let raio-uranio = 8.68e-15 // metros
#let qtd-nucleons-uranio = 238 // partículas
#let u-ma-u = 238.03 // massa atômica do urânio em umidades de massa atômica
#let rho-nucleo-uranio = (u-ma-u * uma) / (4/3 * calc.pi * calc.pow(raio-uranio, 3))
#let d-nucleons-uranio = cubic-model(u-ma-u * uma / qtd-nucleons-uranio, rho-nucleo-uranio)
+ A massa de um átomo está praticamente concentrada no seu núcleo. O raio do núcleo de urânio é $#fmt(raio-uranio)$ m. Usando a massa atômica do urânio, dada na Tab. A.1, calcule o valor da desnidade da "matéria nuclear". Esse núcleo contém $#fmt(qtd-nucleons-uranio, sci:false)$ partículas ou "núcleons". Avalie a separação média entre os núcleos do urânio. Poderá você concluir, a partir do resultado obtido, que se deve tratar a matéria nuclear do mesmo modo que se trata a matéria comum (isto é, os agregados de átomos e moléculas)?

  #solution([
    Consideremos a massa atômica do Urânio, dada na Tab. A.1. igual a $#fmt(u-ma-u)$ unidades de massa atômica (u). Lembrando que $1 "u" = #fmt(uma, digits: 4, sci: true) "kg"$, a densidade da "matéria nuclear" do Urânio é igual a:
    $
      rho = frac(m dot u, display(frac(4, 3) pi r^3)) = frac(#fmt(u-ma-u, sci: false) "u" dot #fmt(uma, digits: 4, sci: true) "kg/u", display(frac(4, 3) pi (#fmt(raio-uranio) "m")^3)) = #fmt(rho-nucleo-uranio, digits: 2, sci: true) "kg/m"^3
    $

    Supondo um modelo cúbico e que o núcleo contém $#fmt(qtd-nucleons-uranio, sci:false)$ partículas, a separação média entre os núcleons é:

    $
      d = root(3, (display((m dot u )/ N))/rho) = root(3, (m dot u)/(N dot rho)) = root(3, (#fmt(u-ma-u, sci:false) dot #fmt(uma, digits: 4, sci: true))/(#fmt(qtd-nucleons-uranio, sci: false) dot #fmt(rho-nucleo-uranio, digits: 2, sci: true))) = #fmt(d-nucleons-uranio, digits: 2, sci: true) " m"
    $

  ])


//Dados do problema
#let raio-terra = 6.37e6 // metros
#let massa-terra = 5.98e24 // kg
#let volume-terra = 4/3 * calc.pi * calc.pow(raio-terra, 3)
#let rho-terra = massa-terra / volume-terra
#let raio-sol = 6.96e8 // metros
#let massa-sol = 1.98e30 // kg
#let volume-sol = 4/3 * calc.pi * calc.pow(raio-sol, 3)
#let rho-sol = massa-sol / volume-sol
+ Usando os dados da Tab. 13.1, calcule a densidade média da Terra e so Sol. Quando você compara esses valores com os dados da Tab. 2.2, qual é a sua conclusão sobre a estrutura desses dois corpos?

  #solution([
    #set enum(numbering: "i)")
    + Terra:
      - Massa: $M = #fmt(massa-terra, sci: true)$ kg
      - Raio médio: $R = #fmt(raio-terra, sci: true)$ m

    $
      rho = M/(display(4/3 pi R^3)) = (#fmt(massa-terra, sci: true) "kg")/display(4/3 pi (#fmt(raio-terra, sci: true) " m")^3) = (#fmt(massa-terra, sci: true) "kg")/(#fmt(volume-terra, digits: 2, sci: true) " m"^3) = #fmt(rho-terra, digits: 2, sci: true) " kg/m"^3
    $

    + Sol:
      - Massa: $M = #fmt(massa-sol, sci: true, digits: 2)$ kg
      - Raio médio: $R = #fmt(raio-sol, sci: true, digits: 2)$ m

    $
      rho = M/(display(4/3 pi R^3)) = (#fmt(massa-sol, digits: 2, sci: true) "kg")/display(4/3 pi (#fmt(raio-sol, sci: true, digits: 2) " m")^3) = (#fmt(massa-sol, sci: true, digits: 2) "kg")/(#fmt(volume-sol, digits: 2, sci: true) " m"^3) = #fmt(rho-sol, digits: 2, sci: true) " kg/m"^3
    $
  ])

// Dados do problema
#let qtd-atomos-universo = calc.pow(10.0, 80) // átomos
#let raio-universo = calc.pow(10.0, 26) // metros
#let volume-universo = (4/3 * calc.pi * calc.pow(raio-universo, 3))
#let rho-universo = (qtd-atomos-universo * h-ma-kg) / volume-universo
#let atomos-por-volume-m3 = qtd-atomos-universo / volume-universo
#let volume-universo-cm3 = volume-universo * 1e6
#let atomos-por-volume-cm3 = qtd-atomos-universo / volume-universo-cm3
+ Avalie a densidade média do universo, usando a informação dada na Seç. 1.3. Admitindo-se que todos os átomos estivesses distribuídos uniformemente em todo o universo, quantos átomos existiriam em cada centímetro cúbico? Admita a hipótese de que todos os átomos são de hidrogênio.

  #solution([
    Na Seç. 1.3., foi informado que "o universo deve conter \[...\] um total de \[$N = $\] $#fmt(qtd-atomos-universo, sci: true)$ átomos numa região de raio \[$R = $\] $#fmt(raio-universo, sci: true)$ m".  Admitindo-se que todos esses átomos são de hidrogênio, cuja massa é igual a 
    
    $
      m = #fmt(h-ma-u) "u" dot #fmt(uma, digits:4, sci: true) "kg/u" = #fmt(h-ma-kg, sci: true, digits: 2) "kg",
    $

    e seja o volume do universo igual a
    
    $
      V = 4/3 pi R^3 = 4/3 pi (#fmt(raio-universo, sci: true, digits: 2) "m")^3 = #fmt(volume-universo, digits: 2, sci: true) " m"^3.
    $

    Então, a densidade estimada para o universo é:

    $
      rho = (N dot m)/V = (#fmt(qtd-atomos-universo, digits: 2, sci: true) dot #fmt(h-ma-kg, digits: 2, sci: true) "kg") / (#fmt(volume-universo, digits: 2, sci: true) " m"^3) = #fmt(rho-universo, digits: 2, sci: true) " kg/m"^3
    $



    A quantidade de átomos por unidade de volume é:

    $
      N/V = (#fmt(qtd-atomos-universo, sci: true, digits: 2) "átomos")/(#fmt(volume-universo, digits: 2, sci: true) " m"^3)  = (#fmt(qtd-atomos-universo, digits: 2, sci: true) "átomos")/(#fmt(volume-universo-cm3, digits: 2, sci: true) " cm"^3)  = #fmt(atomos-por-volume-cm3, digits: 2, sci: true) "átomos/cm"^3
    $

    Portanto, cada centímetro cúbico contém, em média, $#fmt(atomos-por-volume-cm3, digits: 2)$ átomos.
  ])


// Dados do problema
#let c = 2.9979e8 // m/s
#let quantidade-voltas = c * 1 / (2 * calc.pi * raio-terra)
#let ano-luz = c * 365 * 24 * 3600
+ A velocidade da luz no vácuo é de $#fmt(c, digits: 4, sci: true) "m" dot "s"^(-1)$. Transforme esse resultado em km por hora. Quantas voltas em torno da Terra poderia dar, um raio luminoso durante $1$ segundo? (Use a Tab. 13.1 para os dados relativos à Terra). Que distância esse raio liminoso percorria em um ano? Essa distância é chamada _ano-luz_.

  #solution([
    Cálculo da velocidade da luz $c$ em km por hora:
    $
      c = #fmt(c, digits: 4, sci: true) " m" dot "s"^(-1) = #fmt(c, digits: 4, sci: true) " m" dot "s"^(-1) dot (1 " km")/(#fmt(1000) " m") dot (#fmt(3600)  " s")/(1" h") = #fmt(c * 3.6, digits: 4, sci: true) " km/h".
    $

    Sabendo que o raio da Terra é $#fmt(raio-terra)$ metros, a quantidade $k$ de voltas que um raio luminoso poderia dar em volta da Terra durante $Delta t = 1$ segundo é tal que:

    $
      c = (Delta s)/(Delta t) arrow.double c = (k dot (2 pi R)) / (Delta t) &arrow.double k = (c dot Delta t) / (2 pi R)\
      &arrow.double k = ((#fmt(c, digits: 4, sci: true) " m" dot "s"^(-1)) dot (1 " s"))/(2 pi (#fmt(raio-terra, sci: true, digits: 2) " m"))\
      &arrow.double k approx #fmt(quantidade-voltas, digits: 1) " voltas"
    $

    Em um ano, um raio luminoso percorreria a distância:

    $
      &Delta s = c dot Delta t = (#fmt(c, digits: 4, sci: true) " m" dot "s"^(-1)) dot ( 1 " ano" dot (365 " dias")/(1 " ano") dot (24 " h")/(1 " dia") dot (#fmt(3600) " s")/(1 " h") )\
      &Delta s = #fmt(ano-luz, digits: 2, sci: true) " m"
    $
  ])

// Dados do poblema
#let raio-orbital = 1.49e11
+ O raio da órbita terrestre é de $#fmt(raio-orbital)$ m. Este comprimento é chamado _unidade astronômica_, A.U. Represente um ano-luz em unidades astronômicas (veja Prob. 2.13).

  #solution([
    $
      1 "ano-luz" = #fmt(ano-luz, digits: 2, sci: true) " m" dot (1 "A.U.")/(#fmt(raio-orbital, digits: 2, sci: true) " m") = #fmt(ano-luz/raio-orbital, digits: 2, sci: true) " A.U."
    $
  ])


// Dados do Problema 2.15
#let unidade-astronomica = 1.49e11 //metros
#let c = 2.9979e8 //velocidade da luz em m/s
#let ano-luz = c * (365*24*60*60) // metros
#let paralaxe-segundos = 0.76 //segundos de graus
#let paralaxe-graus = paralaxe-segundos * (1/60.0) * (1/60.0) // graus
#let paralaxe = paralaxe-graus * (calc.pi / 180.0) // paralaxe em radianos
#let r-metros = unidade-astronomica/paralaxe //metros
#let r-ua = r-metros/unidade-astronomica // Unidades Astronômicas
#let r-ano-luz = r-metros / ano-luz // Ano-luz

+ _Paralaxe_ é a diferença na direção aparende de um objeto, resultante da mudança de posição do observador. (Segure um lápis na sua frente e feche inicialmente o olho direito e depois o esquerdo. Observer que, em cada caso, o lápis parece situado em posição diferente, em relação ao plano de fundo.) _Paralaxe estelar_ é a mudança aparente, da posição de uma estrela, como resultante do movimento orbital da Terra em torno do Sol. Ela é dada, quantitativamente, pela metade do ângulo, subentedido pelo diâmetro da órbita terrestre $T_1T_2$ perpendicular à linha que uni a estrela ao Sol (Veja Fig. 2.10). Ela é dada por $theta = 1/2(180^(°) - alpha - beta)$, sendo $alpha$ e $beta$ medidos nas duas posições $T_1$ e $T_2$ separadas por seis meses. A distância $r$, da estrela ao Sol, pode ser obtida pela relação $a = r theta$, onde $a$ é o raio da órbita terrestre e $theta$ é expresso em radianos. A estrela que apresenta maior paralaxe, cujo valor é $0,76^(prime.double)$ (isto é, a estrela mais próxima) é $alpha$-Centauro. Calcule a sua distância do Sol, expressa em metros, anos-luz e unidades astronômicas (A.U.).

  #figure(
    cetz.canvas({
      import cetz.draw: *

      let S = (0,0) // Sol
      let T1 = (3.5, 0) // Posição T1 da Terra
      let T2 = (-T1.at(0), 0)  // Posição T2 da Terra
      let E = (-1, 5.5) // Estrela alpha-Centauro
      
      let raio = 1.5
      let alphaAngle = calc.atan2(calc.abs(E.at(0)-T1.at(0)), calc.abs(E.at(1)-T1.at(1)))
      let alphaStart = 180deg
      let alphaStop = alphaStart - alphaAngle

      let betaAngle = calc.atan2(calc.abs(E.at(0)-T2.at(0)), calc.abs(E.at(1)-T2.at(1)))
      let betaStart = 0deg
      let betaStop = betaAngle

      let thetaAngle = 180deg - alphaAngle - betaAngle
      let thetaStart = 180deg + betaAngle
      let thetaStop = thetaStart + thetaAngle

      // Órbita da Terra
      circle(S, radius: (T1.at(0), 0.7), name: "orbita")

      // Linhas tracejadas entre cos corpos celestes
      line(E, S, stroke: (dash: "dashed"), name: "ES")
      line(E, T1, stroke: (dash: "dashed"), name: "ET1")
      line(E, T2, stroke: (dash: "dashed"), name: "ET2")
      line(T1, T2, stroke: (dash: "dashed"), name: "T1T2")

      // Corpos Celestes
      circle(S, radius: (0.2), fill: yellow, name: "sol")
      circle(T1, radius: (0.15), fill: blue, name: "t1")
      circle(T2, radius: (0.15), fill: blue, name: "t2")
      circle(E, radius: (0.1), fill: orange, name: "estrela")

      // Ângulos
      arc((T1.at(0)-raio, 0), start: alphaStart, stop: alphaStop, radius: raio, mark: (start: ">", end: ">", fill: black), name: "arc-alpha")
      arc((T2.at(0)+ raio, 0), start: betaStart, stop: betaStop, radius: raio, mark: (start: ">", end: ">", fill: black), name: "arc-beta")
      arc((E.at(0)-raio*calc.cos(betaAngle), E.at(1)-raio*calc.sin(betaAngle)), start: thetaStart, stop: thetaStop, radius: raio, mark: (start: ">", end: ">", fill: black), name: "arc-theta")

      // Medida do raio orbital da Terra
      line((S.at(0), -0.5), (T1.at(0), -0.5), mark: (start: ">>", end: ">>", fill: black), name: "raio-orbital")
      for x in (S.at(0), (T1.at(0))) {
        line((x, -0.3), (x, (-0.7)))
      }


      // Etiquetas de descrição dos elementos
      content("sol", "Sol", anchor: "north-east", padding: 0.2)
      content("t1", $T_1$, anchor: "west", padding: 0.25)
      content("t2", $T_2$, anchor: "east", padding: 0.25)
      content("estrela", "Estrela", anchor: "west", padding: 0.2)
      content("ES", $r$, anchor: "east", padding: 0.1)
      content("arc-alpha.mid", $alpha$, anchor: "south-east", padding: 0.01)
      content("arc-beta.mid", $beta$, anchor: "south-west", padding: -0.01)
      content("arc-theta.mid", $2theta$, anchor: "south-east", padding: 0.1)
      content("raio-orbital.mid", $a$, fill: white, anchor: "north", padding: 0.1)
    }),
    caption: "Fig. 2.10 (Problema 2.15)"
  )<fig-probl-2.15>

  #solution([
    Inicialmente, vamos converter a paralaxe de _segundos de graus_ ($""^prime.double$) para radianos:

    $
      theta = #fmt(paralaxe-segundos, sci: false)^prime.double times (1^prime)/(60^prime.double) times (1^(circle.small))/(60^prime) times (pi "rad")/(180^(circle.small)) = #fmt(paralaxe, digits: 2, sci: true) "rad"
    $

    Então, sabendo que o raio orbital terrestre é igual a $#fmt(unidade-astronomica, digits: 2, sci: true)$ m , a distância $r$ da estrela $alpha$-Centauro até o sol é:

    $
      a = r theta &arrow.double r = a/theta\
      &arrow.double r = (#fmt(unidade-astronomica, digits: 2, sci: true) "m")/(#fmt(paralaxe, digits: 2)) = #fmt(r-metros, digits: 2, sci: true) " m"\
      &arrow.double r = (#fmt(unidade-astronomica, digits: 2, sci: true) "m") dot (1 "ano-luz")/(#fmt(ano-luz, digits: 2, sci: true) " m") = #fmt(r-ano-luz, digits: 2, sci: true) "anos-luz"\
      &arrow.double r = #fmt(r-metros, digits: 2, sci: true) " m" dot (1 "A.U.")/(#fmt(unidade-astronomica, digits: 2, sci: true) "m") = #fmt(r-ua, digits: 2, sci: true) "A.U."    
    $
  ])

// Dados do problema 2.16
#let paralaxe-segundos = 1
#let paralaxe = paralaxe-segundos * (1.0/60) * (1.0/60) * (calc.pi / 180) // em radianos
#let parsec-metros = unidade-astronomica / paralaxe // metros
#let parsec-ano-luz = parsec-metros / ano-luz // anos-luz
#let parsec-ua = parsec-metros / unidade-astronomica // Unidades astronômicas
+ Um _parsec_ é a distância, ao Sol, de uma estrela cuja paralaxe é de $1^prime.double$. Represente o _parsec_ em metros, anos-luz e unidades astronômicas. Represente a distãncia, dada em _parsec_ em termos da paralaxe, em segundos de arco.

  #solution([
    Inicialmente, vamos converter a paralaxe de _segundos de graus_ ($""^prime.double$) para radianos:

    $
      theta = #fmt(paralaxe-segundos, sci: false)^prime.double times (1^prime)/(60^prime.double) times (1^(circle.small))/(60^prime) times (pi "rad")/(180^(circle.small)) = #fmt(paralaxe, digits: 2, sci: true) "rad"
    $

    Então, sabendo que o raio orbital terrestre é igual a $#fmt(unidade-astronomica)$ m , o _parsec_ pode ser calculado como segue:

    $
      a = r theta &arrow.double r = a/theta\
      &arrow.double r = (#fmt(unidade-astronomica, digits: 2, sci: true) "m")/(#fmt(paralaxe, digits: 2, sci: true)) = #fmt(parsec-metros, digits: 2, sci: true) " m"\
      &arrow.double r = (#fmt(unidade-astronomica, digits: 2, sci: true) "m") dot (1 "ano-luz")/(#fmt(ano-luz,digits: 2, sci: true) " m") = #fmt(parsec-ano-luz, digits: 2, sci: true) "anos-luz"\
      &arrow.double r = #fmt(parsec-metros, digits: 2, sci: true) " m" dot (1 "A.U.")/(#fmt(unidade-astronomica, digits: 2, sci: true) "m") = #fmt(parsec-ua, digits: 2, sci: true) "A.U."    
    $
  ])


// Dados do Problema 2.17
#let s = 4140 // km
#let ang = (s * 1e3)/raio-terra
#let ang-graus = ang * (180/calc.pi)
+ A distância entre São Francisco e Nova York, medida ao longo de um círculo máximo entre as duas cidade é de $#fmt(s, sci: false)$ km. Calcule o ângulo entre as verticais  das duas cidades.

  #solution([
    $
      s = R theta arrow.double theta = display(s/R) arrow.double theta = (#fmt(s, sci: false, digits: 0) " km" dot (10^3 " m")/(1 " km"))/(#fmt(raio-terra, digits: 2, sci: true) " m") = #fmt(ang, sci: false) " rad" = #fmt(ang-graus, sci: false, digits: 1)^circle.small
    
    $
  ])

// Dados do problema 2.18
#let distancia-m31 = 2.5e22 // metros
#let diametro-m31 = 1e21 // metros
#let theta-rad = diametro-m31 / distancia-m31
#let theta-graus = theta-rad * 180 / calc.pi
#let angulo-solido = (calc.pi * calc.pow(diametro-m31/2, 2)) / (calc.pow(distancia-m31, 2))
+ Usando os dados da legenda da Fig. 1.6, determine o ângulo subebtendido pelo diâmetro da Grande Galáxia M-31, quando observada da Terra. Dê o resultado em radianos e graus. Deteminine também o ângulo sólido subentendido pela nebulosa.\ \ \

  #solution([
    De acordo com o enunciado da referida figura, a Grande Galáxia M-31 encontra-se a $R = #fmt(distancia-m31, digits: 2, sci: true)$ m do sistema solar e possui diâmetro de cerca de $d = #fmt(diametro-m31, digits: 2, sci: true)$ m. Portanto, o ângulo $theta$ subebtendido pelo seu diâmetro é tal que:

    $
      d = R theta arrow.double theta = d/R & arrow.double theta = (#fmt(diametro-m31, digits: 2, sci: true) " m") / (#fmt(distancia-m31, digits: 2, sci: true) " m") = #fmt(theta-rad, digits: 2, sci: false) "rad"\
      &arrow.double theta = #fmt(theta-rad, digits: 2, sci: false) "rad" dot (180^circle.small)/(pi " rad") = #fmt(theta-graus, digits: 1)^circle.small
    $

    O ângulo sólido $Omega$ subendendido pela nebulosa é tal que

    $
      Omega = S/R^2 & arrow.double Omega = (pi display((d/2)^2))/R^2 = (pi display(((#fmt(diametro-m31, digits: 2, sci: true) " m")/ 2)^2))/((#fmt(distancia-m31, digits: 2, sci: true) " m")^2) = #fmt(angulo-solido, digits: 2, sci: true) " esterorradianos"
    $

  ])

+ Usando a Tab. de funções trigonométricas existente no Apêndice, calcule o ângulo para o qual $sin theta$ e $tan theta$ diferem por (a) 10%, (b) 1% e (c) 0,1%. Faça o mesmo para $sin theta$ e $theta$, e para $tan theta$ e $theta$, quando $theta$ é expresso em radianos. Qual é a conclusão que você pode tirar dos seis resultados?

  #solution([

    #set table(
      stroke: (x, y) => if y==0 {
        (top: 0.7pt + black)
        (bottom: 0.7pt + black)
        
      } else if y > 0 {
        (bottom: 0.7pt + black)
      },
      fill: (x, y) => if y  == 0 {
        gray.lighten(20%)
      } else if calc.rem(y, 2) == 0 {
        gray.lighten(60%)
      }
    )

    // Comparação entre as funções seno e tangente
    #let compara_sen_tg(erro_perc_limite: 10) = {
      let theta = 1
      let dtheta = theta/10000
      let seno = calc.sin(theta)
      let tangente = calc.tan(theta)
      let erro_perc = calc.abs(seno/tangente - 1)
      while erro_perc >= erro_perc_limite/100.0 {
        theta = theta - dtheta
        seno = calc.sin(theta)
        tangente = calc.tan(theta)
        erro_perc = calc.abs(seno/tangente - 1)
      }
      let theta-graus = theta * 180.0 / calc.pi
      return (theta-graus, theta, seno, tangente, erro_perc * 100)
    }

    #let theta-a = compara_sen_tg(erro_perc_limite: 10)

    #let theta-b = compara_sen_tg(erro_perc_limite: 1)

    #let theta-c = compara_sen_tg(erro_perc_limite: .1)

    #let nums = range(0, 5)

    #let p = (2, 4, 4, 4, 3)


    A @tab-sen-tan mostra os valores de $theta$ para os quais as funções $sin theta$ e $tan theta$ diferem por (a) 10%, (b) 1% e (c) 0,1%. Para ranto aplicamos a relação:

    $
      (|sin theta - tan theta|) / (|tan theta|) <= e,
    $
    em que $e = 10%$, $1%$ e $0,1%$.

    #figure(
      table(
        columns: 5,
        align: right,
        table.header(
          [$theta$ (°)], [$theta$ (rad)], [$sin theta$], [$tan theta$], [$e$ (%)]
        ),
        ..nums.map(n => [#fmt(theta-a.at(n), sci: false, digits: p.at(n))]),
        ..nums.map(n => [#fmt(theta-b.at(n), sci: false, digits: p.at(n))]),
        ..nums.map(n => [#fmt(theta-c.at(n), sci: false, digits: p.at(n))])
    ),
    caption: [Comparação entre $sin theta$ e $tan theta$]
  )<tab-sen-tan>

    // Comparação entre seno e theta 
    #let compara_sen_theta(erro_perc_limite: 10) = {
      let theta = 1
      let dtheta = theta/10000
      let seno = calc.sin(theta)
      let erro_perc = calc.abs(seno/theta - 1)
      while erro_perc >= erro_perc_limite/100.0 {
        theta = theta - dtheta
        seno = calc.sin(theta)
        erro_perc = calc.abs(seno/theta - 1)
      }
      let theta-graus = theta * 180.0 / calc.pi
      return (theta-graus, theta, seno, erro_perc * 100)
    }

    #let theta-a = compara_sen_theta(erro_perc_limite: 10)

    #let theta-b = compara_sen_theta(erro_perc_limite: 1)

    #let theta-c = compara_sen_theta(erro_perc_limite: .1)

    #let nums = range(0, 4)

    #let p = (2, 4, 4, 3)

    A @tab-sen-theta mostra os valores de $theta$ para os quais as funções $sin theta$ e $theta$ (em radianos) diferem por (a) 10%, (b) 1% e (c) 0,1%. Para ranto aplicamos a relação:

    $
      (|sin theta - theta|) / (theta) <= e,
    $
    em que $e = 10%$, $1%$ e $0,1%$.

    #figure(
      table(
        columns: 4,
        align: right,
        table.header(
          [$theta$ (°)], [$theta$ (rad)], [$sin theta$], [$e$ (%)]
        ),
        ..nums.map(n => [#fmt(theta-a.at(n), sci: false, digits: p.at(n))]),
        ..nums.map(n => [#fmt(theta-b.at(n), sci: false, digits: p.at(n))]),
        ..nums.map(n => [#fmt(theta-c.at(n), sci: false, digits: p.at(n))])
    ),
    caption: [Comparação entre $sin theta$ e $theta$]
  )<tab-sen-theta>

    // Comparação entre  tangente e theta
    #let compara_tg_theta(erro_perc_limite: 10) = {
      let theta = 1
      let dtheta = theta/10000
      let tangente = calc.tan(theta)
      let erro_perc = calc.abs(tangente/theta - 1)
      while erro_perc >= erro_perc_limite/100.0 {
        theta = theta - dtheta
        tangente = calc.tan(theta)
        erro_perc = calc.abs(tangente/theta - 1)
      }
      let theta-graus = theta * 180.0 / calc.pi
      return (theta-graus, theta, tangente, erro_perc * 100)
    }

    #let theta-a = compara_tg_theta(erro_perc_limite: 10)

    #let theta-b = compara_tg_theta(erro_perc_limite: 1)

    #let theta-c = compara_tg_theta(erro_perc_limite: .1)

    #let nums = range(0, 4)

    #let p = (2, 4, 4, 3)

    A @tab-tan-theta mostra os valores de $theta$ para os quais as funções $tan theta$ e $theta$ (em radianos) diferem por (a) 10%, (b) 1% e (c) 0,1%. Para ranto aplicamos a relação:

    $
      (|tan theta - theta|) / (theta) <= e,
    $
    em que $e = 10%$, $1%$ e $0,1%$.

    #figure(
      table(
        columns: 4,
        align: right,
        table.header(
          [$theta$ (°)], [$theta$ (rad)], [$tan theta$], [$e$ (%)]
        ),
        ..nums.map(n => [#fmt(theta-a.at(n), sci: false, digits: p.at(n))]),
        ..nums.map(n => [#fmt(theta-b.at(n), sci: false, digits: p.at(n))]),
        ..nums.map(n => [#fmt(theta-c.at(n), sci: false, digits: p.at(n))])
    ),
    caption: [Comparação entre $tan theta$ e $theta$]
  )<tab-tan-theta>

  Os resultados mostram que para ângulos muito pequenos (medidos em radianos), as três funções - seno, tangente e o próprio ângulo - têm valores muito próximos entre si. Ou seja, para $theta << 1$ rad, valem as aproximações:

  $
    cases(
      sin theta approx tan theta\
      sin theta approx theta\
      tan theta approx theta
    )
  $
  ])




