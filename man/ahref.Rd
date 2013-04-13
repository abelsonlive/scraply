\name{ahref}
\alias{ahref}
\title{extract link and xmlValue from an xml node representing an "a" tag}
\usage{
  ahref(node, colnames = c("value", "link"))
}
\arguments{
  \item{node}{an XML node representing an "a" tag.}

  \item{colnames}{what to call the value and link extracted
  (in that order)}
}
\value{
  a data.frame consisting of the link path and the text
  associated with the "a" tag.
}
\description{
  extract link and xmlValue from an xml node representing
  an "a" tag
}
\examples{
# see example in the README
}

