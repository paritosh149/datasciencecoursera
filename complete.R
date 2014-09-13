complete<-function(directory,id=1:332){
  if(file.exists(directory))
  {
    ## print(paste(directory,'exists.',sep=" "))
    DF <- matrix(,0,2)
    dimnames(DF)[[2]] <- list('id','nobs')
    for(name in id)
    {
      filename <- sprintf('%03d',name)
      ##print(filename)
      fullfilename <- paste(directory,"/",filename,".csv",sep="")
      if(file.exists(fullfilename))
      {
        ## print(paste(fullfilename,"exists",sep=" "))
        tab01 <- read.csv(fullfilename)
        ##MF <- merge(MF,tab01,all.x=TRUE,all.y=TRUE)
        count <- 0
        for(row in 1:nrow(tab01))
        {
          ##print(tab01[row,'sulfate'])
          if(!is.na(tab01[row,'Date']) & !is.na(tab01[row,'sulfate']) & !is.na(tab01[row,'nitrate']))
          {
            count<- count + 1
          }
        }
        DF <- rbind(DF,c(name,count))
      }
      else
      {
        #print(paste(fullfilename,"does not exists",sep=" "))
      }
    }
    print(DF)
  }
  else
  {
    print(paste(directory,"does not exists.",sep=" "))
  }
}