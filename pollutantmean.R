pollutantmean <- function(directory, pollutant, id=1:332){
  if(file.exists(directory))
  {
    files <- list.files(directory, full.names=TRUE)[id]
    ## print(paste(directory,'exists.',sep=" "))
    MF <- c()
    for(file in files)
    {
         tab01 <- read.csv(file)
         colData <- tab01[pollutant]
         MF <- c(MF,colData[!is.na(colData)])
    }
    meanvalue <- round(mean(MF),digits=3)
    print(meanvalue)
  }
  else
  {
    print(paste(directory,"does not exists.",sep=" "))
  }
}