% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/two_fct.R
\name{ft_mapping}
\alias{ft_mapping}
\title{Create a Mapping Table of Original and Modified Factor Levels}
\usage{
ft_mapping(original_factor, modified_factor)
}
\arguments{
\item{original_factor}{The original factor vector before modification.}

\item{modified_factor}{The modified factor vector after modification.}
}
\value{
A data frame containing the mapping of original to modified levels.
}
\description{
Creates a data frame mapping the original factor levels to the modified levels.
}
\examples{
# Original and modified factor vectors
original_factor <- factor(c('apple', 'banana', 'cherry'))
modified_factor <- factor(c('apple_fruit', 'banana_fruit', 'cherry_fruit'))

# Create mapping table
ft_mapping(original_factor, modified_factor)
}
\author{
Kai Guo
}
