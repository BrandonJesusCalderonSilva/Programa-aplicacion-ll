import Foundation

struct Articulo {
    var nombre: String
    var cantidad: Int
}

var inventario: [Articulo] = []
var continuar = true

while continuar {
    print("\nMENU")
    print("1. Registrar articulos.")
    print("2. Ver lista de articulos.")
    print("3. Consultar articulos en existencias.")
    print("4. Salir.")
    print("Elige una opcion (numero):", terminator: " ")
    
    // Fuerza la salida en pantalla antes de pedir texto
    fflush(stdout) 
    
    guard let entradaOpcion = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines),
          let opcion = Int(entradaOpcion) else {
        print("Entrada no válida. Por favor, ingresa un número del 1 al 4.")
        continue
    }
    
    print() // Salto de línea estético
    
    switch opcion {
    case 1:
        print("1. Registrar articulo")
        print("Por favor escriba la cantidad de articulos que desea ingresar")
        fflush(stdout)
        
        if let entradaCantidad = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines),
           let cantidadAIngresar = Int(entradaCantidad), cantidadAIngresar > 0 {
            
            print("\nRegistro de articulos\n")
            
            for _ in 1...cantidadAIngresar {
                let numeroArticulo = inventario.count + 1
                
                print("Ingrese el nombre del articulo, posteriormente presione enter:")
                print("Articulo \(numeroArticulo)", terminator: " ")
                fflush(stdout)
                let nombre = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                
                print("\nIngrese la cantidad de este articulo:\n")
                print("Cantidad \(numeroArticulo)", terminator: " ")
                fflush(stdout)
                let cantStr = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "0"
                let cantidad = Int(cantStr) ?? 0
                
                inventario.append(Articulo(nombre: nombre, cantidad: cantidad))
                print()
            }
        } else {
            print("Cantidad no válida.")
        }
        
    case 2:
        print("2. Ver lista de articulos.")
        print("Listado de productos")
        
        if inventario.isEmpty {
            print("No hay articulos en la lista.")
        } else {
            for (index, item) in inventario.enumerated() {
                print("Articulo \(index + 1) \(item.nombre)")
                print("Cantidad \(index + 1) \(item.cantidad)")
            }
        }
        
    case 3:
        print("3. Consultar articulos en existencias.")
        
        if inventario.isEmpty {
            print("No hay articulos registrados.")
        } else {
            for (index, item) in inventario.enumerated() {
                print("Articulo \(index + 1): \(item.nombre)")
                print("Cantidad \(index + 1):\(item.cantidad)")
            }
        }
        
    case 4:
        print("Saliendo del sistema...")
        continuar = false
        
    default:
        print("Opción no válida. Intente con un número del 1 al 4.")
    }
}