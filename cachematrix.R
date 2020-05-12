## Two functions that create special object that stores a matrix and
##cahes its inverse

## Create a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x<<-y 
    m<<- NULL
  }
  get <- function() x 
  setinverse <- function(inverse) m<<- inverse
  getinverse <- function() m
  list(set=set, get=get, setinverse =setinverse, getinverse=getinverse)
}


## Computes the inverse of a special "matrix" from the 
##function above. Test if it has already been calculated, if yes, retrieve
## from cache 

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
