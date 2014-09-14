corr<-function(directory,threshold=0){
  if(file.exists(directory))
  {
    ID0 <- complete(directory)
    ID1 <- ID0[ID0['nobs']>threshold,1]
    retdata<-c()
    for(ID in ID1)
    {
        filename <- sprintf("%s/%03d.csv", directory, ID)
      tab01 <- read.csv(filename)
      corrData <- cor(tab01['sulfate'],tab01['nitrate'],use='complete')
      retdata <- c(retdata,corrData)
    }
    retdata
  }
  else
  {
    print(paste(directory,"does not exists.",sep=" "))
  }
}