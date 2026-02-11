#include <iostream>
#include <string>
#include <sstream>
#include <vector>
#include <cctype> 

using namespace std;

string clasificar(const string& s) {
    if (s.empty()) return "Vacio";

    bool todosDigitos = true;
    bool todasMinusculas = true;
    bool todasMayusculas = true;
    bool puedeSerIdentificador = true;

    if (isdigit(s[0])) puedeSerIdentificador = false;

    for (char c : s) {
        if (!isdigit(c)) todosDigitos = false;
        if (!islower(c)) todasMinusculas = false;
        if (!isupper(c)) todasMayusculas = false;
        
        if (!isalnum(c) && c != '_') puedeSerIdentificador = false;
    }

    if (todosDigitos) return "Numero entero";
    if (todasMinusculas) return "Palabra en minusculas";
    if (todasMayusculas) return "Palabra en mayusculas";
    if (puedeSerIdentificador) return "Identificador (Variable)";
    
    return "Simbolos/Mixto";
}

int main() {
    string entrada, segmento;
    vector<string> lista;

    cout << "Introduce el texto a analizar: ";
    if (getline(cin, entrada)) {
        istringstream iss(entrada);

        while (iss >> segmento) {
            lista.push_back(segmento);
        }

        cout << "\n--- Resultados del Analisis ---\n";
        for (const auto& s : lista) {
            cout << s << " -> " << clasificar(s) << endl;
        }
    }

    return 0;
}
