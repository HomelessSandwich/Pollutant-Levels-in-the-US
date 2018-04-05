pollutantmean <- function(directory = getwd(), pollutant, id = 1:332)
{
        
        data <- data.frame()
        
        for(i in id){
                
                if(i < 10)
                {
                        tempData <- read.csv(paste(directory, "/specdata/", "00", as.character(i), ".csv" ,sep = ""))
                        bad <- is.na(tempData[[pollutant]])
                        tempData <- tempData[!bad, ]
                        data <- rbind(data, tempData)
                } 
                
                else if(i >= 9  & i < 100)
                {
                        tempData <- read.csv(paste(directory, "/specdata/", "0", as.character(i), ".csv", sep = ""))
                        bad <- is.na(tempData[[pollutant]])
                        tempData <- tempData[!bad, ]
                        data <- rbind(data, tempData)
                } 
                
                else 
                {
                        tempData <- read.csv(paste(directory, "/specdata/", as.character(i), ".csv", sep = ""))
                        bad <- is.na(tempData[[pollutant]])
                        tempData <- tempData[!bad, ]
                        data <- rbind(data, tempData)
                }
                
        }
        
        if(pollutant == "sulfate"){
                sulfateMean <- mean(data$sulfate)  
                print(paste("Sulfate Mean:", sulfateMean))
        }
        
        else {
                nitrateMean <- mean(data$nitrate)
                print(paste("Nitrate Mean:", nitrateMean))
        }
        
}