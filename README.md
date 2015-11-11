# Shipping Delay Prediction in Multiple Myeloma

## Requirements:

Install the docval package:

```
R CMD INSTALL docval/docval_1.1.4_gcrma.tar.gz
```

Install custom chip definition files V16, downloadable from brainarray website:
 
 * [cdf](http://brainarray.mbni.med.umich.edu/Brainarray/Database/CustomCDF/16.0.0/entrezg.download/hgu133plus2hsentrezgcdf_16.0.0.tar.gz)
 * [probe](http://brainarray.mbni.med.umich.edu/Brainarray/Database/CustomCDF/16.0.0/entrezg.download/hgu133plus2hsentrezgprobe_16.0.0.tar.gz)
 * [db](http://brainarray.mbni.med.umich.edu/Brainarray/Database/CustomCDF/16.0.0/entrezg.download/hgu133plus2hsentrezg.db_16.0.0.tar.gz)
 
## Analyze new sample (Affymetrix U133 2.0 plus array):

 * Clone the repo onto your computer ```git clone https://github.com/meissnert/intext.git```
 * Modify the path in line 30 of the ```delay_pred.R``` script and point it to your .CEL file(s)
 * Run ```Rscript delay_pred.R```
 * Results will be written to ```int_ext_prediction.csv```
 
