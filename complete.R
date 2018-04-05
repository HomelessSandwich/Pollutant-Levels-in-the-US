complete <- function(directory = getwd(), id) 
{
        
        completeData <- data.frame()
        
        for(i in id){
                
                if(i < 10)
                {
                        data <- read.csv(file <- paste(directory, "/specdata/", "00", 
                                                            as.character(i), ".csv", sep = ""))
                        dataCleaned <- na.omit(data)
                        rows <- nrow(dataCleaned)
                        tempTable <- c(i, rows)
                        completeData <- rbind(completeData, tempTable)
                } 
                
                else if(i >= 9  & i < 100)
                {
                        data <- read.csv(file <- paste(directory, "/specdata/", "0", 
                                                       as.character(i), ".csv", sep = ""))
                        dataCleaned <- na.omit(data)
                        rows <- nrow(dataCleaned)
                        tempTable <- c(i, rows)
                        completeData <- rbind(completeData, tempTable)
                } 
                
                else
                { 
                        data <- read.csv(file <- paste(directory, "/specdata/", 
                                                       as.character(i), ".csv", sep = ""))
                        dataCleaned <- na.omit(data)
                        rows <- nrow(dataCleaned)
                        tempTable <- c(i, rows)
                        completeData <- rbind(completeData, tempTable)
                } 
                
        }
        
        colnames(completeData) <- c("id", "nobs")
        return(completeData)
        
}