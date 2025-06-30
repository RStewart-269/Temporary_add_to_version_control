getwd()


filepaths <- function (id){
  allfiles = list.files(getwd())
  file.path(getwd(), allfiles[id])
}

# To allow R to read/find the 001, etc files from the folder. Otherwise, it kept saying no 1.csv file
directory <- "C:/Users/ystew/Desktop/Temporary_add_to_version_control/specdata"
id <- 1
file_name <- sprintf("%03d.csv", id) # Pad with leading zeros using sprintf format the ID as a three-digit integer with leading zeros, followed by ".csv".
file_path <- paste0(directory, "/", file_name) # Construct the whole path

file_path

mydata <- sapply(file_path, read.csv)

complete <- function(directory, id = 1:332) {
  for(i in 1:332) {
  directory <- "C:/Users/ystew/Desktop/Temporary_add_to_version_control/specdata"
  file_name <- sprintf("%03d.csv", id)
  file_path <- paste0(directory, "/", file_name, sep = "")
  mydata <- sapply(file_path, read.csv)
  nobs <- nrow(na.omit(mydata))
  nobs <- sum(complete.cases(mydata))
  i <- i+1
  }
    completedata <- c(id,nobs)
}


complete(directory,id= 1:332)

tempdir()
dir.create(tempdir())

getwd()


class(mydata)
str(mydata)
length(mydata)

complete <- function(directory, id = 1:332) {
  directory <- "C:/Users/ystew/Desktop/Temporary_add_to_version_control/specdata"
  file_name <- list.files(directory, full.names=TRUE)
  nobs <- c()
  for (i in 1:length(id)) {
    all_data <- read.csv(file_name[id[i]])
    nobs[i] <- sum(complete.cases(all_data))
  }
  data.frame(id, nobs)
}

complete("specdata", 1:332) [1:2,] # This looks promising. I just need to tweak it a little bit more to give the desired results
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])





complete <- function(directory, id = 1:332) {
  directory <- "C:/Users/ystew/Desktop/Temporary_add_to_version_control/specdata"
  airpolutionfiles <- list.files(directory, full.names=TRUE)
  monitorsdata_all <- data.frame()
  for (i in id) {
    monitorsdata_all <- rbind(monitorsdata_all, read.csv(airpolutionfiles[i]))
  }
  df <- subset(monitorsdata_all, complete.cases(monitorsdata_all))
  
  #then combine
  data.frame(id, nobs)
}

complete("specdata",332:1)[1:2,] 
#one way to count number of ids
  nobs <- table(df$ID)
  