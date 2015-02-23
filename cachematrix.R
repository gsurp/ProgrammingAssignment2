## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        # starts cache with a null value
        Cache<- NULL
        # sets a matrix that takes on new value x
        setMatrix<- function(xValue){
                x<<- xValue
                # now matrix is set, so cache is cleared
                Cache<<-NULL
        }
        # prints the matrix from memory
        getMatrix<-function(){ 
        x
        }
        # to cache inverse solution
        cacheInverse<-function(solve){
                Cache<<-solve
        }
        #print stored cache of inverse
        getInverse<-function(){
                Cache
        }
        #print list of all functions
        list( setMatrix = setMatrix,getMatrix=getMatrix,cacheInverse=cacheInverse,getInverse=getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        # get cache
        inverse<-x$getInverse()
        if(!is.null(inverse)){
                message("getting data from Cache")
                return(inverse)
        }
        #get matrix to calculate inverse if cache is NULL
        # then store it to cache
        mydata<-x$getMatrix()
        inverse<-solve(mydata)
        x$cacheInverse(inverse)
        
        inverse
        ## Return a matrix that is the inverse of 'x'
}
