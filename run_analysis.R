
# Set directory
setwd("./UCI HAR Dataset")

# Read test data set
read_data_set <- function(set_name){

	# subject_id
	tmp <- read.table(paste("./",set_name,"/subject_",set_name,".txt",sep=""))
	colnames(tmp) <- "subject_id"
	res <- tmp

	# activity_label
	tmp <- read.table(paste("./",set_name,"/y_",set_name,".txt",sep=""))
	labels <- read.table("./activity_labels.txt")
	tmp <- merge(labels,tmp)[-1]
	colnames(tmp) <- "activity_label"
	res <- cbind(res,tmp)
	remove(labels)

	# features
	tmp <- read.table(paste("./",set_name,"/X_",set_name,".txt",sep=""))
	features <- read.table("./features.txt")
	colnames(tmp) <- sapply(features[,"V2"],as.character)
	res <- cbind(res,tmp)
	remove(features)

	# Singals
	tmp <- read.table(paste("./",set_name,"/Inertial Signals/body_acc_x_",set_name,".txt",sep=""))
	colnames(tmp) <- paste("body_acc_x_",as.character(1:128),sep="")
	res <- cbind(res,tmp)
	tmp <- read.table(paste("./",set_name,"/Inertial Signals/body_acc_y_",set_name,".txt",sep=""))
	colnames(tmp) <- paste("body_acc_y_",as.character(1:128),sep="")
	res <- cbind(res,tmp)
	tmp <- read.table(paste("./",set_name,"/Inertial Signals/body_acc_z_",set_name,".txt",sep=""))
	colnames(tmp) <- paste("body_acc_z_",as.character(1:128),sep="")
	res <- cbind(res,tmp)
	tmp <- read.table(paste("./",set_name,"/Inertial Signals/body_gyro_x_",set_name,".txt",sep=""))
	colnames(tmp) <- paste("body_gyro_x_",as.character(1:128),sep="")
	res <- cbind(res,tmp)
	tmp <- read.table(paste("./",set_name,"/Inertial Signals/body_gyro_y_",set_name,".txt",sep=""))
	colnames(tmp) <- paste("body_gyro_y_",as.character(1:128),sep="")
	res <- cbind(res,tmp)
	tmp <- read.table(paste("./",set_name,"/Inertial Signals/body_gyro_z_",set_name,".txt",sep=""))
	colnames(tmp) <- paste("body_gyro_z_",as.character(1:128),sep="")
	res <- cbind(res,tmp)
	tmp <- read.table(paste("./",set_name,"/Inertial Signals/total_acc_x_",set_name,".txt",sep=""))
	colnames(tmp) <- paste("total_acc_x_",as.character(1:128),sep="")
	res <- cbind(res,tmp)
	tmp <- read.table(paste("./",set_name,"/Inertial Signals/total_acc_y_",set_name,".txt",sep=""))
	colnames(tmp) <- paste("total_acc_y_",as.character(1:128),sep="")
	res <- cbind(res,tmp)
	tmp <- read.table(paste("./",set_name,"/Inertial Signals/total_acc_z_",set_name,".txt",sep=""))
	colnames(tmp) <- paste("total_acc_z_",as.character(1:128),sep="")
	res <- cbind(res,tmp)

	res
}

# read sets in
dt <- rbind( read_data_set("test"), read_data_set("train") )

# extract colums with mean or std
a <- grep( "-mean\\(\\)", colnames(dt))
b <- grep( "-std\\(\\)", colnames(dt))
res <- dt[,sort(c(1,2,a,b))]

# summarise with subject_id and activity_label
library(dplyr)
tmp <- res %>% group_by(subject_id,activity_label) %>% summarise_each(funs(mean))

# write table
setwd("../")
write.table(tmp,file="result.txt",row.names=FALSE)
