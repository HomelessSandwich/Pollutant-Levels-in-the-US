pollutantData <- function(directory = getwd(), id)
{
        
        data <- data.frame()
        
        for(i in id){
                
                if(i < 10)
                {
                        tempData <- read.csv(paste(directory, "/specdata/", "00", as.character(i), ".csv" ,sep = ""))
                        tempData <- na.omit(tempData)
                        data <- rbind(data, tempData)
                } 
                
                else if(i >= 9  & i < 100)
                {
                        tempData <- read.csv(paste(directory, "/specdata/", "0", as.character(i), ".csv", sep = ""))
                        tempData <- na.omit(tempData)
                        data <- rbind(data, tempData)
                } 
                
                else 
                {
                        tempData <- read.csv(paste(directory, "/specdata/", as.character(i), ".csv", sep = ""))
                        tempData <- na.omit(tempData)
                        data <- rbind(data, tempData)
                }
                
        }
        
        return(data)
}