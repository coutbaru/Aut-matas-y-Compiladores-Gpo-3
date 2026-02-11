#include <iostream>
#include <string>
#include <sstream>
#include <regex>

using namespace std;

int main() {
    string entrada, palabra;

    // Expresiones regulares dadas
    regex numero("^-?\\d+$");
    regex minusculas("^[a-z]+$");
    regex mayusculas("^[A-Z]+$");
    regex identificador("^[a-zA-Z_][a-zA-Z0-9_]*$");
    regex simbolo("^[^\\w\\s]+$");

    int contNumero = 0;
    int contMinusculas = 0;
    int contMayusculas = 0;
    int contIdentificador = 0;
    int contSimbolo = 0;

    cout << "Introduce el texto a analizar: ";
    getline(cin, entrada);

    istringstream iss(entrada);

    while (iss >> palabra) {

        if (regex_match(palabra, numero)) {
            cout << palabra << " -> Numero Entero\n";
            contNumero++;
        }
        else if (regex_match(palabra, minusculas)) {
            cout << palabra << " -> Palabra en Minusculas\n";
            contMinusculas++;
        }
        else if (regex_match(palabra, mayusculas)) {
            cout << palabra << " -> Palabra en Mayusculas\n";
            contMayusculas++;
        }
        else if (regex_match(palabra, identificador)) {
            cout << palabra << " -> Identificador\n";
            contIdentificador++;
        }
        else if (regex_match(palabra, simbolo)) {
            cout << palabra << " -> Simbolo\n";
            contSimbolo++;
        }
        else {
            cout << palabra << " -> No clasificado\n";
        }
    }

    cout << "\n--- Conteo Final ---\n";
    cout << "Numeros Enteros: " << contNumero << endl;
    cout << "Palabras Minusculas: " << contMinusculas << endl;
    cout << "Palabras Mayusculas: " << contMayusculas << endl;
    cout << "Identificadores: " << contIdentificador << endl;
    cout << "Simbolos: " << contSimbolo << endl;

    return 0;
}

