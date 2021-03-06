% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/removeRowsN.R
\name{removeRowsN}
\alias{removeRowsN}
\title{Removes rows that contain 'NA' and 'Inf' entries}
\usage{
removeRowsN(traj, id_field=TRUE)
}
\arguments{
\item{traj}{[data.frame (numeric)]: longitudinal data. Each row represents an individual trajectory (of observations). The columns show the observations at consecutive time points.}

\item{id_field}{[numeric or character] Whether the first column of the \code{traj} is a unique (\code{id}) field. Default: \code{FALSE}. If \code{TRUE} the function recognises the second column as the first time step.}
}
\value{
A matrix with complete observations
}
\description{
This function removes any rows in which an 'NA' or an 'Inf' entry is found.
}
\details{
Given a matrix (or a dataframe) containing an 'NA' or an 'Inf' entry, the function returns only rows with complete observations.
}
\examples{
traj <- traj
removeRowsN(traj, id_field=TRUE)
}
