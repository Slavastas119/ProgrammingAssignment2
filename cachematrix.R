## Here we want to compute the inverse of a matrix or use the
## cached value if the job was done earlier

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setinv <- function(inverse) inv <<- inverse
	getinv <- function() inv
	list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## This function computes the inverse of the special "matrix"
## or take the cached value

cacheSolve <- function(x, ...) {
    inv <- x$getinv()
	if(!is.null(inv)) {
		message("getting cached data")
		return(inv)
	}
	data <- x$get()
	inv <- solve(data)
	x$setinv(inv)
	inv
}
