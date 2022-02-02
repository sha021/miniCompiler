# mini Compiler

This compiler is developed for MINI_L. <br/>
MINI_L reference page: https://www.cs.ucr.edu/~mafar001/compiler/webpages1/mini_l.html <br/>

### requirement
* bolt server provided by ucr.edu
* g++ version 7.4.0 (Ubuntu 7.4.0-1ubuntu1~18.04.1)
* flex version 2.6.4
* bison (GNU) version 3.0.4

### running code
```
make clean
make
./mini_l *filename*.min > out.mil   
/*This performs lexical analysis, Parsing, Semantic Analysis and MIL Code generation on the file containing mini l code in *filename*.min, and redirects the MIL code output to out.mil*/
./mil_run out.mil < input.txt
/*executing the generated MIL code with input provided from input.txt*/
```
