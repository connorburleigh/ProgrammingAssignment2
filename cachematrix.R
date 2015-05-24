## A pair of functions to get check if the inverse
## of a matrix is already cached, and a second function 
## either recall the invserse or calculate it

## creates a list of functions to run as one function
## that searches for the inverse in the cache
makeInverse <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- as.matrix(y)
    i <<- NULL
  }
  get <- function() {
    x
  }
  setInverse <- function(inverse) {
    i <<- inverse
  }
  getInverse <- function() {
    i
  }
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## Conditional that looks for the inverse, then either
## retrieves it or calculates it.

cacheInverse <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setInverse(i)
  i
}