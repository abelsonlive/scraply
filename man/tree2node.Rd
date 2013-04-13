\name{tree2node}
\alias{tree2node}
\title{extract nodes from a html tree without having to write xpath!}
\usage{
  tree2node(tree, select, children = NULL)
}
\arguments{
  \item{tree}{a html tree returned from url2tree}

  \item{select}{a css selector to navigate to, e.g.
  'class="keyword"'. This can also be a node attribute,
  e.g. 'cellpadding="1"'. Make sure to include double
  quotes around the value associated with the class/id.}

  \item{children}{OPTIONAL subsequent children nodes to
  navigate to. e.g. "a", "ul/li/a" etc.}
}
\value{
  a list of nodes matching the constructed xpath expression
}
\description{
  extract nodes from a html tree without having to write
  xpath!
}
\examples{
# see example in the README
}

