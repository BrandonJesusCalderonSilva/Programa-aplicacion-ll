import Foundation

// Estructura para almacenar los artículos del inventario
struct Articulo {
    var nombre: String
    var cantidad: Int
}

// Arreglo donde se guardarás los productos en memoria
var inventario: [Articulo] = []

// Función principal del menú
func ejecutarMenu() {
    var continuar = true
    
    while continuar {
        print("\nMENU")
        print("1. Registrar articulos.")
        print("2. Ver lista de articulos.")
        print("3. Consultar articulos en existencias.")
        print("4. Salir.")
        print("\nElige una opcion (numero): ", terminator: "")
        
        guard let opcionInput = readLine(), let opcion = Int(opcionInput) else {
            print("Opción no válida. Intente de nuevo.")
            continue
        }
        
        switch opcion {
        case 1:
            registrarArticulos()
        case 2:
            verListaArticulos()
        case 3:
            consultarArticulosEnExistencias()
        case 4:
            print("¡Hasta luego!")
            continuar = false
        default:
            print("Opción fuera de rango. Por favor elija un número del 1 al 4.")
        }
    }
}

// Opción 1: Registrar artículos
func registrarArticulos() {
    print("\n1. Registrar articulo")
    print("Por favor escriba la cantidad de articulos que desea ingresar: ", terminator: "")
    
    guard let cantidadTiposInput = readLine(), let cantidadTipos = Int(cantidadTiposInput), cantidadTipos > 0 else {
        print("Número no válido.")
        return
    }
    
    print("\nRegistro de articulos")
    
    for i in 1...cantidadTipos {
        print("\nIngrese el nombre del articulo, posteriormente presione enter:")
        print("Articulo \(i) ", terminator: "")
        let nombre = readLine() ?? ""
        
        print("\nIngrese la cantidad de este articulo:")
        print("Cantidad \(i) ", terminator: "")
        let cantidadStr = readLine() ?? "0"
        let cantidad = Int(cantidadStr) ?? 0
        
        let nuevoArticulo = Articulo(nombre: nombre, cantidad: cantidad)
        inventario.append(nuevoArticulo)
    }
}

// Opción 2: Ver lista de artículos
func verListaArticulos() {
    print("\n2. Ver lista de articulos.")
    print("Listado de productos")
    
    if inventario.isEmpty {
        print("No hay artículos registrados.")
    } else {
        for (index, articulo) in inventario.enumerated() {
            print("Articulo \(index + 1) \(articulo.nombre)")
            print("Cantidad \(index + 1) \(articulo.cantidad)")
        }
    }
}

// Opción 3: Consultar artículos en existencias
func consultarArticulosEnExistencias() {
    print("\n3. Consultar articulos en existencias.")
    
    if inventario.isEmpty {
        print("No hay artículos registrados.")
    } else {
        for (index, articulo) in inventario.enumerated() {
            print("Articulo \(index + 1): \(articulo.nombre)")
            print("Cantidad \(index + 1): \(articulo.cantidad)")
        }
    }
}

// Ejecución del programa
ejecutarMenu()