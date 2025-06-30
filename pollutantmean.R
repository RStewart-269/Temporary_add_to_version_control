getwd()

directory <- getwd()

# Download and unzip the file from an online source into the working directory

dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataset_url, "specdata.zip")
unzip("specdata.zip", exdir = "specdata")

# To specify the location of the folder and the files in the folder in the directory

folder <- "C:/Users/ystew/Desktop/Temporary_add_to_version_control.specdata"
file_list <- list.files(path=folder, pattern="*.csv")

# To find the mean of the data columns, ignoring any missing values coded as NA
pollutantmean <- function(directory, pollutant, id = 1:332){
  filelist <- list.files(path = directory, pattern = "\\.csv", full.names = TRUE)
  i <- seq(1, min(length(filelist), length(id)))
  value <- lapply(filelist[i], read.csv)
  value <- sapply(value, '[[', pollutant)
  mean(as.numeric(unlist(value)), na.rm = TRUE)
  
}

# To check if the function works
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72) # not accurate, still looking for the mistake
pollutantmean("specdata", "nitrate", 23) # not accurate, still looking for the mistake
