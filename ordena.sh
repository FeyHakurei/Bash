#!/bin/bash

echo "Ordenando archivos..."

# creamos carpetas si no existen
mkdir -p Imagenes
mkdir -p Documentos
mkdir -p Comprimidos

movidos=0

# recorro la carpeta actual
for f in *; do
    # me aseguro de que es un archivo normal y no este mismo script
    if [ -f "$f" ] && [ "$f" != "ordena.sh" ]; then
        
        # saco la extension 
        ext="${f##*.}"
        ext=$(echo "$ext" | tr '[:upper:]' '[:lower:]')
        
        
        case "$ext" in
            jpg|jpeg|png|gif|bmp) 
                mv "$f" Imagenes/
                ((movidos++)) 
                ;;
            pdf|doc|docx|txt|odt) 
                mv "$f" Documentos/
                ((movidos++)) 
                ;;
            zip|rar|tar|gz|7z) 
                mv "$f" Comprimidos/
                ((movidos++)) 
                ;;
            *) 
                ;;
        esac
    fi
done

