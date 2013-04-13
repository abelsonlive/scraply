\name{scraply}
\alias{scraply}
\title{Scrape urls with llply, handling errors}
\usage{
  scraply(ids, fx, sleep = 0)
}
\arguments{
  \item{ids}{A character vector of ids/urls to feed to a
  scraping function}

  \item{fx}{The scraping function to apply across the
  ids/urls}

  \item{sleep}{Seconds to sleep between iterations.}
}
\value{
  A data.frame created by the scraping function (fx), with
  an added "error" column. Urls that dont return data will
  have scraped fields filled with NAs.
}
\description{
  This function works like \code{\link{ldply}}, but
  specifically for page scraping. Like \code{\link{ldply}},
  it applies a function over a list (in this case a list of
  urls) and returns a data.frame. The difference is that
  scraply includes error handling and logging automagically
  This saves you a ton of time when you want to quickly
  write and deploy a page scraper. Happy scraplying!
}
\examples{
# see example in the README
}

