library(randomForest)
library(caret)
library(data.table)
library(mlr)
library(h2o)
library(resample)
library(stringr)

#loads data
train.i1 <- read.csv("i1pos.csv", header=TRUE)
train.e1 <- read.csv("e1pos.csv", header=TRUE)
#sets the data.table
setDF(train.e1)
setDT(train.i1)
#dim - number of rows, number of columns
dim(train.e1)
dim(train.i1) 
#str - lists the classes
str(train.e1)
str(train.i1)
#determines the balance of data
setDT(train.e1)[,.N/nrow(train.e1),Label]
setDF(train.i1)[,.N/nrow(train.i1),Label]
test[,Label := substr(Label,start = 1,stop = nchar(Label)-1)]
#check for missing values in dataset
table(is.na(train.e1))
table(is.na(train.i1))

#create a task
traintask <- makeClassifTask(data = train,target = "Label")
traintask <- makeClassifTask(data = train.e1,target = "Label",positive="1") 
train.i1task <- makeClassifTask(data = train.i1,target = "Label")

rdesc <- makeResampleDesc("CV",iters=5L)

#create learner
bag <- makeLearner("classif.rpart",predict.type = "response")
bag.lrn <- makeBaggingWrapper(learner = bag,bw.iters = 100,bw.replace = TRUE)

r <- resample(learner = rf.lrn
              ,task = train.i1task
              ,resampling = rdesc
              ,measures = list(tpr,fpr,fnr,fpr,acc)
              ,show.info = T)

#make randomForest learner
rf.lrn <- makeLearner("classif.randomForest")
rf.lrn$par.vals <- list(ntree = 100L, importance=TRUE)
r <- resample(learner = rf.lrn, task = traintask, resampling = rdesc, measures = list(tpr,fpr,fnr,fpr,acc), show.info = T)
# Result:

e1 <- read.csv("e1pos.csv", header=TRUE)
e1$Label <- as.factor(e1$Label)


rf.lrn$par.vals <- list(ntree = 100L, importance=TRUE, cutoff = c(0.55,0.45))
r <- resample(learner = rf.lrn, task = traintask, resampling = rdesc, measures = list(tpr,fpr,tnr,fnr,acc), show.info = T)
  
model.e1 <- randomForest(Label ~., data = e1,
                             na.action = na.omit,
                             ntree = 1000,
                             mtry = (0.5*sqrt(length(e1))),
                             CUTOFF = c(0.50,0.50),
                             importance = TRUE,
                             do.trace=100)
print(model.e1)
samples <- c(10,751)
predSamples <- predict(modele1, e1[samples,])
print(predSamples)

runtime.e1 <- randomForest(Label ~., data = e1,
                           na.action = na.omit,
                           ntree = 1000,
                           mtry = (0.5*sqrt(length(e1))),
                           CUTOFF = c(0.5,0.5),
                           importance = TRUE,
                           do.trace = 100)
print(runtime.e1)

i1 <- read.csv("i1pos.csv", header=TRUE)
i1$Label <- as.factor(i1$Label)


model.i1 <- randomForest(Label ~., data = i1,
                       na.action = na.omit,
                       ntree = 1000,
                       mtry = (2*sqrt(length(i1))),
                       CUTOFF = c(0.9,0.1),
                       importance = TRUE,
                       do.trace=100)
print(model.i1)



runtime.i1 <- randomForest(Label ~., data = i1,
                           na.action = na.omit,
                           ntree = 1000,
                           mtry = (2*sqrt(length(i1))),
                           CUTOFF = c(0.9,0.1),
                           importance = TRUE,
                           do.trace=100)
print(runtime.i1)
samples <- c(10,22,274)
predSamples <- predict(modeli1, i1[samples,])
print(predSamples)

varImpPlot(runtime.e1, n.var = 10)
varImpPlot(runtime.i1, n.var = 10)
varImpPlot(model.e1, n.var = 10)
varImpPlot(model.i1, n.var = 10)


getParamSet(rf.lrn)

#set parameter space
params <- makeParamSet(makeIntegerParam("mtry",lower = 1,upper = 30),makeIntegerParam("cutoff",lower = c(0.10,0.90),upper = c(0.90,0.1))

#set validation strategy
rdesc <- makeResampleDesc("CV",iters=5L)

#set optimization technique
ctrl <- makeTuneControlRandom(maxit = 5L)

#start tuning
tune <- tuneParams(learner = rf.lrn, task = traintask, resampling = rdesc, measures = list(acc), par.set = params, control = ctrl, show.info = T)
#[Tune] Result: mtry=2 : nodesize=23 : acc.test.mean=0.858