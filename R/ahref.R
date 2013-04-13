#' extract link and xmlValue from an xml node representing an "a" tag
#'
#' @param node an XML node representing an "a" tag.
#' @param colnames what to call the value and link extracted (in that order)
#'
#' @return
#' a data.frame consisting of the link path and the text associated with the "a" tag.
#'
#' @export
#'
#' @examples
#' # see example in the README
ahref <- function(node, colnames=c("value", "link")) {
    value <- xmlValue(node)
    link <- xmlGetAttr(node, "href")
    output <- data.frame(value, link, stringsAsFactors=FALSE)
    names(output) <- colnames
    return(output)
}
