# Teste Malloc-IO

Aplicação em C++ que realiza o teste de alocação de bloco de memória e leitura de disco.

## Executar o mallocio

### Em Windows

- Baixar o mallocio para windows
- Descompactar o pacote

- Execute o programa pelo prompt de comando (cmd)

> Importante que o arquivo teste.txt esteja no mesmo diretório do executável

- Aguarde o resultado

### Em Linux

- Baixar o mallocio para linux
- Descompactar o pacote
``$ unzip mallocio-lnx-x64.zip``
- Execute o programa

> Importante que o arquivo teste.txt esteja no mesmo diretório do executável
``$ ./mallocio_lnx64``

- Aguarde o resultado

## Build

- Executar o ./configure (ou garantir que tenha os programas a baixo);
    ``make, g++, g++-mingw-w64, zip, tar.``

- Executar o Makefile com o comando;
    ``make linux #(para build linux)``
    ``make windows #(para build windows)``

- O executavel estará no diretório ./build.

## Docker

- Build dockerfile;
    ``docker build -t mallocio .``
- Run docker file.
    ``$ docker run --rm -v ${PWD}:/project mallocio make windows``
    ``$ docker run --rm -it -v ${PWD}:/project mallocio make linux``
    ``$ docker run --rm -it -v ${PWD}:/project mallocio make both``
