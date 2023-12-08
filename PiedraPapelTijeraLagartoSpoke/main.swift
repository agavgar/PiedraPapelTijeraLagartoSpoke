//
//  main.swift
//  PiedraPapelTijeraLagartoSpock
//
//  Created by Alejandro Alberto Gavira García on 7/12/23.
//

import Foundation

enum GameChoice {
    case Rock
    case Paper
    case Scissors
    case Lizard
    case Spock
    case Quit
}

typealias PlayResult = (ganador : String , resultado : String) // ES UNA TUPLA

main()

func main(){
    // Arranca el game loop (Run Loop, buscarlo e informarse)
    while true{
        // Main menu
        // Imprimo las posibilidades
        // Leo la eleccion del usuario
        let userChoice = readUserChoice()
        // Si no es la opcion de salir, sigo jugando
        if !isExit(choice: userChoice){
            // Genero, al azar la jugada del ordenador
            let computerChoice = generateComputerChoice()
            // Evalúo las dos jugadas para saber el ganador
            let result = evaluateMovements(userChoice:userChoice, cpuChoice: computerChoice)
            // Imprimo el resultado
            displayResult(final: result)
            // Volver a juagr o salir
        }else{
            break
        }
    }
}

func readUserChoice() -> GameChoice {
    // Imprimo un menu indicando al usuario lo que debe escribir
    // 0 es Piedra
    // 1 es papel
    // 2 es Tijeras
    // 4 es exit
    // Hasta que no conteste sigo preguntando
    // Lo que el usuario escriba siempre sea texto
    
    var choice : GameChoice = .Paper
    
    while true {
        
        
        print("-------- [ BIENVENIDOS A PIEDRA, PAPEL TIJERAS LAGARTO SPOCK ] --------")
        print("-------- ( ELIGE UNA DE LAS OPCIONES DISPONIBLES ) --------")
        print(" 1. Juega con la roca")
        print(" 2. Juega con el papel")
        print(" 3. Juega con las tijeras")
        print(" 4. Juega con el lagarto")
        print(" 5. Juega con Spock")
        print("")
        print(" 9. SALIR")
        print(" ______________________________________________________________________")
        print("")
        
        if let eleccion = readLine(),
           let numEleccion = Int(eleccion){
            
            // Ya sé que es un entero. Solo hay que averiguar
            // si es uno de los buenos
            
            if numEleccion == 1 {
                choice = .Rock
                break
            }else if numEleccion == 2 {
                choice = .Paper
                break
            }else if numEleccion == 3 {
                choice = .Scissors
                break
            }else if numEleccion == 4 {
                choice = .Lizard
                break
            }else if numEleccion == 5 {
                choice = .Spock
                break
            }else if numEleccion == 9 {
                choice = .Quit
                break
            }
        }
    }
    print("")
    print("El jugador ha escogido \(choice)")
    print("")
    return choice
}

func isExit(choice: GameChoice)->Bool{
    if choice == .Quit{
        return true
    }else{
        return false
    }
    
}

func generateComputerChoice()->GameChoice{
    let eleccion = Int.random(in: 0...5)
    let cpuChoice: GameChoice
    
    if eleccion == 0 {
        cpuChoice =  .Rock
    }else if eleccion == 1 {
        cpuChoice =  .Paper
    }else if eleccion == 2{
        cpuChoice =  .Scissors
    }else if eleccion == 3{
        cpuChoice =  .Lizard
    }else if eleccion == 4{
        cpuChoice =  .Spock
    }else{
        cpuChoice = .Lizard
    }
    print("")
    print("El ordenador ha escogido \(cpuChoice)")
    print("")
    return cpuChoice
}

func evaluateMovements(userChoice: GameChoice, cpuChoice: GameChoice) -> (PlayResult){
    
    let final : (String,String)
    var ganador = ""
    var textoGanador = ""
    
    if userChoice == .Paper {
        
        if cpuChoice == .Rock{
            ganador = "VICTORIA"
            textoGanador = "Papel envuelve la roca"
        }else if cpuChoice == .Scissors{
            ganador = "DERROTA"
            textoGanador = "Tijeras corta papel"
        }else if cpuChoice == .Paper{
            ganador = "EMPATE"
            textoGanador = "Papel al aire"
        }else if cpuChoice == .Lizard{
            ganador = "DERROTA"
            textoGanador = "Lagarto devora papel"
        }else if userChoice == .Spock {
            ganador = "VICTORIA"
            textoGanador = "Papel desautoriza Spock"}
        
    }else if userChoice == .Scissors {
        
        if cpuChoice == .Rock{
            ganador = "DERROTA"
            textoGanador = "Piedra aplasta tijera"
        }else if cpuChoice == .Scissors{
            ganador = "EMPATE"
            textoGanador = "Tijeras al aire"
        }else if cpuChoice == .Paper{
            ganador = "VICTORIA"
            textoGanador = "Tijera corta papel"
        }else if cpuChoice == .Lizard{
            ganador = "VICTORIA"
            textoGanador = "Tijera decapita lagarto"
        }else if userChoice == .Spock {
            ganador = "DERROTA"
            textoGanador = "Spock rompe tijeras"}
        
    }else if userChoice == .Rock {
        
        if cpuChoice == .Rock{
            ganador = "EMPATE"
            textoGanador = "Piedra al suelo"
        }else if cpuChoice == .Scissors{
            ganador = "VICTORIA"
            textoGanador = "Roca aplasta tijeras"
        }else if cpuChoice == .Paper{
            ganador = "DERROTA"
            textoGanador = "Papel envuelve piedra"
        }else if cpuChoice == .Lizard{
            ganador = "VICTORIA"
            textoGanador = "Piedra aplasta roca"
        }else if userChoice == .Spock {
            ganador = "DERROTA"
            textoGanador = "Spock vaporiza piedra"}
        
    }else if userChoice == .Lizard {
        
        if cpuChoice == .Rock{
            ganador = "DERROTA"
            textoGanador = "Piedra aplasta lagarto"
        }else if cpuChoice == .Scissors{
            ganador = "DERROTA"
            textoGanador = "Tijeras decapita lagarto"
        }else if cpuChoice == .Paper{
            ganador = "VICTORIA"
            textoGanador = "Lagarto devora papel"
        }else if cpuChoice == .Lizard{
            ganador = "EMPATE"
            textoGanador = "Ambos pierden la cola"
        }else if userChoice == .Spock {
            ganador = "VICTORIA"
            textoGanador = "Lagarto envenena Spock"}
        
    }else if userChoice == .Spock {
        
        if cpuChoice == .Rock{
            ganador = "VICTORIA"
            textoGanador = "Spock vaporiza piedra"
        }else if cpuChoice == .Scissors{
            ganador = "VICTORIA"
            textoGanador = "Spock rompe tijeras"
        }else if cpuChoice == .Paper{
            ganador = "DERROTA"
            textoGanador = "Papel desautoriza Spock"
        }else if cpuChoice == .Lizard{
            ganador = "DERROTA"
            textoGanador = "Lagarto envenena Spock"
        }else if userChoice == .Spock {
            ganador = "EMPATE"
            textoGanador = "Batalla de spocks en el espacio tiempo"}
    }
    // EVALUAR QUIEN HA GANADO Y COMO LO HIZO
    final = (ganador, textoGanador)
    return final
}

func displayResult(final: PlayResult) -> Void{
    
    print("")
    print("--///!!!! --- [ SELECCIONES REALIZADAS ] --- !!!!///--")
    print("")
    print("++++++"+final.ganador+"++++++++")
    print("")
    print("******"+final.resultado+"******")
    print("")
    print("")
    
}
