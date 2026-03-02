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
        name: "Marcelo Alonso",
        short-name: "Alonso, M.",
      ),
      (
        name: "Edward J. Finn",
        short-name: "Finn, E. J.",
      ),
    ),
    chapter: (
      number: 3,
      title: "Vetores"
    )
  ),
)

#set heading(numbering: none)
== Problemas (pág. 69)

+ Dois vetores, cujos módulos são de 6 e 9 unidades de comprimento, formam um ângulo de (a) 0°, (b) 60°, (c) 90°, (d) 150°, e (e) 180°. Determine o módulo da soma desses vetores e a direção do vetor resultante com relação ao vetor menor.

  #solution([
    Sem perda de generalidade, consideremos um sistema de eixos cartesianos tal que o eixo $x$ coincide com o vetor menor, conforme figura abaixo:

    #let th = 60deg
    #let a = 6
    #let b = 9

    #let bx = b * calc.cos(th)
    #let by = b * calc.sin(th)

    #align(center)[
      #cetz.canvas({
        import cetz.draw: *




        scale(0.5)
        
        line((0, 0), (10, 0), mark: (end: "stealth", fill: black))
        content((10, 0), [$x$], anchor: "north", padding: 0.1)

        line((0, 0), (0, 10), mark: (end: "stealth", fill: black))
        content((0, 10), [$y$], anchor: "east", padding: 0.2)

        arc((2.2, 0), radius: 2.2, start: 0deg, delta: th, mode: "PIE", fill: color.mix((gray, 50%), white), stroke: none)
        content((1.5*calc.cos(th/2), 1.5*calc.sin(th/2)), [$theta$])

        line((0, 0), (a, 0), mark: (end: "stealth", fill: black), stroke: 2pt)
        content((a, 0), [*$A$*], anchor: "north", padding: 0.2)

        line((0,0), (b * calc.cos(th), b * calc.sin(th)), mark: (end: "stealth", fill: black), stroke: 2pt)
        content((b * calc.cos(th), b * calc.sin(th)), [*$B$*], anchor: "north-west", padding: 0.1)

        line((b * calc.cos(th), 0), (b * calc.cos(th), b * calc.sin(th)), (0, b * calc.sin(th)), stroke: (dash: "dashed", paint: gray), name: "u-coords")

        content("u-coords.start", [$B_x$], anchor: "north", padding: 0.2)

        content("u-coords.end", [$B_y$], anchor: "east", padding: 0.2)
      })
    ]


      Designando por $A$, $B$ e $S$ os módulos dos vetores $bold(A)$, $bold(B)$ e da resultante $bold(S)$, respectivamente, então, as componentes do vetor soma são:

      $
        bold(S) = bold(A) + bold(B) => cases(
          S_x = A_x + B_x,
          S_y = A_y + B_y
        )
        => cases(
          S_x = A + B cos theta,
          S_y = B "sen" theta
        )
      $

      O módulo de $bold(S)$ é:

      $
        S &= sqrt(S_x^2 + S_y^2) = sqrt((A + B cos theta)^2 + (B "sen" theta)^2)\
        &= sqrt(A^2 + 2 A B cos theta + B^2 cos^2 theta + B^2 "sen"^2 theta)\
        &= sqrt(A^2 + B^2 + 2 A B cos theta)
      $

      O ângulo que o vetor resultante forma com relação ao menor vetor é $alpha$, tal que:
      $
        tan alpha = S_y/S_x = (B "sen" theta)/(A + B cos theta) => alpha = arctan ((B "sen" theta)/(A + B cos theta))
      $

      Para os ângulos considerados, temos:

      #let ths = (0deg, 60deg, 90deg, 150deg, 180deg)
      #let sx = ths.map(th => a + b * calc.cos(th))
      #let sy = ths.map(th => b * calc.sin(th))

      #let s = ths.map(th => calc.sqrt(a*a + b*b + 2 * a * b * calc.cos(th)))
      
      #let alfas = ths.map(th => calc.atan2(a + b * calc.cos(th), b * calc.sin(th)))

      #let result = ()

      #for i in range(ths.len()) {
        result.push(fmt(ths.at(i).deg(), digits: 0)+"°")
        result.push(fmt(sx.at(i)))
        result.push(fmt(sy.at(i)))
        result.push(fmt(s.at(i)))
        result.push(fmt(alfas.at(i).deg())+"°")
      }




      
      #set table(
        stroke: none,
        fill: (x, y) => if y == 0 {color.mix((gray, 60%), (white, 20%))} else {
          if calc.rem(y, 2) == 0 {color.mix((gray, 40%), (white, 90%))}
        },
        align: (x, y) => if y == 0 {center} else {right}
      )
      #align(center, table(
        columns: 5,

        table.header([$theta$], [$S_x$], [$S_y$], [$S$], [$alpha$]),

        ..result

      ))
  ])


+ Calcule o ângulo entre dois vetores, de módulos iguais a 10 e 15 unidades de comprimento, nos casos em que a soma desses vetores é (a) 20 unidades de comprimento e (b) 12 unidades de comprimento. Desenhe uma figura apropriada.

  #solution([
    #let a = 10
    #let b = 15

    Sejam $bold(A)$, $bold(B)$ os vetores considerados e $bold(S) = bold(A) + bold(B)$ o veor resultante.  Apliquemos a lei dos cossenos:
    $
        bold(S) = bold(A) + bold(B) => S^2 = A^2 + B^2 + 2 A B cos theta
    $
    em que $theta$ é o ângulo entre $bold(A)$ e $bold(B)$. Isolando $theta$, temos:


    $
      theta = arccos[(S^2 - (A^2 + B^2))/(2 A B)]
    $

    #let sa = 20
    
    #let numa = sa*sa - (a*a + b*b)
    #let dena = 2 * a * b
    #let tha = calc.acos(numa/dena)


    Para $A = #a$, $B = #b$ e $S = #sa$,
    $
      theta = arccos[(S^2 - (A^2 + B^2))/(2 A B)] = arccos[(#sa ^2 - (#a ^2 + #b ^2))/(2 dot #a dot #b)] = arccos(#numa / #dena) approx #fmt(tha.deg())°
    $

    #align(center)[
      #cetz.canvas({
        import cetz.draw: *

        scale(0.25)
        rotate(15deg)

        arc((3, 0), radius: 3, start: 0deg, delta: tha, mode: "PIE", fill: color.mix(gray, white), stroke: none)
        content((3 * calc.cos(tha/2), 3 * calc.sin(tha/2)), [$theta$], anchor: "west", padding: 0.2)

        line((0, 0), (a, 0), mark: (end: "stealth", fill: black), name: "vec-a")
        content("vec-a.end", [$bold(A)$], anchor: "west", padding: 0.1)

        line((0, 0), (b * calc.cos(tha), b * calc.sin(tha)), mark: (end: "stealth", fill: black), name: "vec-b")
        content("vec-b.end", [$bold(B)$], anchor: "east", padding: 0.2)

        line((0, 0), (a + b * calc.cos(tha), b * calc.sin(tha)), mark: (end: "stealth", fill: black), name: "vec-b")
        content("vec-b.end", [$bold(S)$], anchor: "west", padding: 0.2)

        line((a, 0), (a + b * calc.cos(tha), b * calc.sin(tha)), (b * calc.cos(tha), b * calc.sin(tha)), stroke: (dash: "dashed", paint: gray))
      })
    ]


    #let sb = 12
    
    #let numb = sb*sb - (a*a + b*b)
    #let denb = 2 * a * b
    #let thb = calc.acos(numb/denb)


    Para $A = #a$, $B = #b$ e $S = #sb$,
    $
      theta = arccos[(S^2 - (A^2 + B^2))/(2 A B)] = arccos[(#sb ^2 - (#a ^2 + #b ^2))/(2 dot #a dot #b)] = arccos(#numb / #denb) approx #fmt(thb.deg())°
    $


    #align(center)[
      #cetz.canvas({
        import cetz.draw: *

        scale(0.25)
        rotate(-15deg)

        arc((3, 0), radius: 3, start: 0deg, delta: thb, mode: "PIE", fill: color.mix(gray, white), stroke: none)
        content((3 * calc.cos(thb/2), 3 * calc.sin(thb/2)), [$theta$], anchor: "west", padding: 0.2)

        line((0, 0), (a, 0), mark: (end: "stealth", fill: black), name: "vec-a")
        content("vec-a.end", [$bold(A)$], anchor: "west", padding: 0.1)

        line((0, 0), (b * calc.cos(thb), b * calc.sin(thb)), mark: (end: "stealth", fill: black), name: "vec-b")
        content("vec-b.end", [$bold(B)$], anchor: "east", padding: 0.2)

        line((0, 0), (a + b * calc.cos(thb), b * calc.sin(thb)), mark: (end: "stealth", fill: black), name: "vec-b")
        content("vec-b.end", [$bold(S)$], anchor: "west", padding: 0.2)

        line((a, 0), (a + b * calc.cos(thb), b * calc.sin(thb)), (b * calc.cos(thb), b * calc.sin(thb)), stroke: (dash: "dashed", paint: gray))
      })
    ]
  ])