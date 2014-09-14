complete<-function(directory,id=1:332){
  if(file.exists(directory))
  {
    ## print(paste(directory,'exists.',sep=" "))
    files <- list.files(directory, full.names=TRUE)[id]
    filecount <- length(files)
    DF <- data.frame(Id=rep(0,filecount),nobs=0)
    for(fnum in 1:filecount)
    {
        tab01 <- read.csv(files[fnum])
        ID <- tab01[1,4]
        count <- complete.cases(tab01)
        totalcount <- sum(count)
        DF[fnum,] <- c(ID,totalcount)
    }
    DF
  }
  else
  {
    print(paste(directory,"does not exists.",sep=" "))
  }
}