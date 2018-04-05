corr <- function(directory = getwd(), threshold = 0) 
{
        
        source("complete.R")
        source("pollutants.R")
        
        numFiles <- length(list.files(paste(directory, "/specdata", sep = ""), pattern = "\\d\\d\\d.csv"))
        vector <- c()
        
        completeTable <- complete(id = 1:numFiles)
        pollutantData <- pollutantData(id = 1:numFiles)
        
        for(i in 1:numFiles)
        {
                
                if(completeTable[i, 2] > threshold)
                {
                        idData <- pollutantData[pollutantData$ID %in% i, ] # Selects rows of ID = i
                        vector <- c(vector, cor(idData$sulfate, idData$nitrate))
                }
                
        }
        
        return(vector)
}