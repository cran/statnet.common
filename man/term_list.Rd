% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/formula.utilities.R
\name{term_list}
\alias{term_list}
\alias{as.term_list}
\alias{as.term_list.term_list}
\alias{as.term_list.default}
\alias{c.term_list}
\alias{[.term_list}
\alias{print.term_list}
\title{A helper class for list of terms in an formula}
\usage{
term_list(x, sign = +1, env = NULL)

as.term_list(x, ...)

\method{as.term_list}{term_list}(x, ...)

\method{as.term_list}{default}(x, sign = +1, env = NULL, ...)

\method{c}{term_list}(x, ...)

\method{[}{term_list}(x, i, ...)

\method{print}{term_list}(x, ...)
}
\arguments{
\item{x}{a list of terms or a term; a \code{term_list}}

\item{sign}{a vector specifying the signs associated with each term (\code{-1} and \code{+1})}

\item{env}{a list specifying the environments, or NULL}

\item{...}{additional arguments to methods}

\item{i}{list index}
}
\description{
Typically generated by \code{\link[=list_rhs.formula]{list_rhs.formula()}}, it contains, in
addition to a list of \code{\link[=call]{call()}} or similar objects, attributes
\code{"sign"} and \code{"env"}, containing, respectively a vector of
signs that the terms had in the original formula and a list of
environments of the formula from which the term has been
extracted. Indexing and concatenation methods preserve these.
}
\examples{

e1 <- new.env()
f1 <- a~b+c
environment(f1) <- e1
f2 <- ~-NULL+1

(l1 <- list_rhs.formula(f1))
(l2 <- list_rhs.formula(f2))

(l <- c(l1,l2))
\dontshow{
stopifnot(identical(c(unclass(l)), alist(b, c, NULL, 1)))
stopifnot(identical(attr(l, "sign"), c(1,1,-1,1)))
stopifnot(identical(attr(l, "env"), rep(list(e1, globalenv()), each=2)))
}

(l <- c(l2[1], l1[2], l1[1], l1[1], l2[2]))
\dontshow{
stopifnot(identical(c(unclass(l)), alist(NULL, c, b, b, 1)))
stopifnot(identical(attr(l, "sign"), c(-1,1,1,1,1)))
stopifnot(identical(attr(l, "env"), list(globalenv(), e1, e1, e1, globalenv())))
}

}
\seealso{
\code{\link[=list_rhs.formula]{list_rhs.formula()}}, \code{\link[=list_summands.call]{list_summands.call()}}
}
