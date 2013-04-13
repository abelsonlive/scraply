\name{url2tree}
\alias{url2tree}
\title{download a url and convert the html into a parseable tree in one step.}
\usage{
  url2tree(url)
}
\arguments{
  \item{url}{A url to download and convert into a html
  tree}
}
\value{
  an html tree to parse with \code{\link{tree2node}}
}
\description{
  this function combines \code{\link{getURL}} and
  \code{\link{htmlTreeParse}}
}
\examples{
# see example in the README
}

