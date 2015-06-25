# original author: Tobias Meissner

library(docval)
library(doMC)
library(hgu133plus2hsentrezg.db)

load("predictor/pam.intext.042013.Rdata") # load the shipping delay predictor

###############################################################################
# int/ext function
###############################################################################

intext.docval = function(cel.file, path) {
  # preprocessing using docval
  external = ReadAffy(filenames=cel.file, celfile.path=path, cdfname="hgu133plus2hsentrezg")
  exprs.external.gcrma = wrap.val.add(external, params, method="gcrma")
  
  exprs <- exprs(exprs.external.gcrma)
  exprs <- as.matrix(exprs[-grep("AFFX", rownames(exprs)),]) # remove affy probesets
  
  intext = sig.intext(exprs)
  
  return(intext)
}

###############################################################################
# predict shipping delay (ext) for a list of Affy 133 Plus 2.0 cel files
###############################################################################

path = "/path/to/cel/files"
cel.files =  dir(path)

registerDoMC(cores=16) # change number of cores if needed
intext <- foreach(i=1:length(cel.files), .combine="c") %dopar% {	
  res <- intext.docval(cel.files[i], path)
  return(res)
}	

table <- data.frame(CEL = cel.files,
                    INTEXT_prediction = ifelse(intext==2, "int", "ext")
)

# exxport 
write.table(table, "int_ext_prediction.csv", quote=F, row.names=F, col.names=F, sep=";")						
