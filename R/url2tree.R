#' download a url and convert the html into a parseable tree in one step.
#'
#' this function combines \code{\link{getURL}} and \code{\link{htmlTreeParse}}
#'
#' @param url A url to download and convert into a html tree
#'
#' @return
#' an html tree to parse with  \code{\link{tree2node}}
#'
#' @export
#'
#' @examples
#' # see example in the README
url2tree <- function(url) {
    page <- getURL(url)
    tree <-htmlTreeParse(url, useInternalNodes=T)
    return(tree)
}