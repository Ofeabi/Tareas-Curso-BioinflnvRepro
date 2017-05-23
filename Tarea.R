## Biostrings: permite manipulas las secuencias como un objeto

## Instalar Biostrings y cargar la libreria 
source("https://bioconductor.org/biocLite.R")
biocLite("Biostrings")
library(Biostrings)

# Cargar el archivo con la funcion readDNSStringSet ya que estan en formato fasta las originales
readDNStringSetAgave <- readDNAStringSet("/home/ofelia/Dropbox/BIOLOGIA/DOCTORADO/PROYECTO INVESTIGACION/SECUENCIAS/psbA_trnH.fasta")

# Convertir las secuencias fasta en un archivo StringSet (este es de utilidad ya que otros programas de alineamientos
# como Muscle requieren el input en este formato)
BStringAgave= readDNStringSetAgave
BStringAgave

# Proporciona el numero de secuencias que hay en el archivo
length(BStringAgave)

#Verificar las caracteristicas del objeto BStringAgave
str(BStringAgave)

#Nos proporciona la cantidad de cada una de las bases nucleotidicas para cada una de las secuencias 
alphabetFrequency(BStringAgave, baseOnly=TRUE, as.prob=TRUE)
#Debido a que biostrings es un programa muy sencillo tambien se opto por hacer un alineamiento en Muscle

library(muscle)
## Con el archivo anterior clase StringSet se hace un alineamiento y se obtiene un objeto DNAMultipleAligment
BStringAgave <- muscle(umax)
BStringAgave

# la siguiente funcion es para especificar la penalidad de los gaps
BStringAgave <- muscle(umax, gapopen = -10)

