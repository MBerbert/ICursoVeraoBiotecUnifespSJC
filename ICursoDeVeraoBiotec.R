library("GEOquery")
library("dplyr")
library("tidyselect")


##Download GSE database
gds <- getGEO("GSE49879", GSEMatrix = T)

##list all expressed genes
ExpressionSetDatas = as.data.frame(pData(phenoData(gds[[1]]))[,c(1,2,6,8)], stringsAsFactors=FALSE)
ExpressionSetDatas = data.frame("GSM" = ExpressionSetDatas$geo_accession, "title" = ExpressionSetDatas$title, stringsAsFactors=FALSE)
ExpressionSetDatas$title = as.data.frame(ExpressionSetDatas$title)


samples = as.matrix(ExpressionSetDatas)
samples <- select(ExpressionSetDatas, starts_with("pith"), starts_with("internode"), starts_with("shoot"), starts_with("rind"))
 
##looking for genes that occur in culm
listWordPatternMatching = c("pith", "internode", "shoot", "rind" )

##I will search in the Title of the data those that correspond with the key words of listWordPatternMatching
##and the retriever will be the position within the dataframe
listPositionGSM = NULL

for (i in 1:length(listWordPatternMatching)) {
  catPosition = grep(listWordPatternMatching[i], ExpressionSetDatas$title)
  listPositionGSM <- append(listPositionGSM, catPosition, after = length(listPositionGSM))
  
}

##With the list of positions I get the GSMnnnn and create a list to be able to download the data of each one
listGSM = NULL

for (x in 1:length(listPositionGSM)) {
  
  acessPoint = as.numeric(listPositionGSM[x])
  listGSM <- append(listGSM, ExpressionSetDatas$geo_accession[acessPoint], after = length(listGSM))
  
}

listGSM <- unique(listGSM)
##Downloading the data of each GSM and mounting a unique dataframe
dfBaseGSM = NULL

for (yyy in 1:length(listGSM)) {
  
  dfTempGSM = NULL
  dfTempGSM = getGEO(listGSM[yyy], GSEMatrix = T)
  dfTempGSM = as.data.frame( Table(dfTempGSM)[,])
  dfTempGSM$geo_accesion = listGSM[yyy]
  
  dfBaseGSM <- append(dfBaseGSM, dfTempGSM, after = length(dfBaseGSM))
  
}


dfBaseGSM = data.frame("geo_accesion" = dfBaseGSM$geo_accesion, "ID_REF" = dfBaseGSM$ID_REF, "VALUE" = dfBaseGSM$VALUE) 

