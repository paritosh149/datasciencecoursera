pollutantmean <- function(directory, pollutant, id=1:332){
  if(file.exists(directory))
  {
    ## print(paste(directory,'exists.',sep=" "))
    MF <- matrix(,0,4)
    dimnames(MF)[[2]] <- list('Date','sulfate','nitrate','ID')
    for(filename in id)
    {
      filename <- sprintf('%03d',filename)
      ##print(filename)
      fullfilename <- paste(directory,"/",filename,".csv",sep="")
      if(file.exists(fullfilename))
      {
         ## print(paste(fullfilename,"exists",sep=" "))
         tab01 <- read.csv(fullfilename)
         MF <- merge(MF,tab01,all.x=TRUE,all.y=TRUE)
      }
      else
      {
        #print(paste(fullfilename,"does not exists",sep=" "))
      }
    }
    if(nrow(MF)>0)
    {
     ## print(MF[pollutant])
    meanvalue <- round(mean(MF[[pollutant]], na.rm=TRUE),digits=3)
    print(meanvalue)
    }
    else
    {
      #print(nrow(MF))
      #print('no data')
    }
  }
  else
  {
    print(paste(directory,"does not exists.",sep=" "))
  }
}