#' extract nodes from a html tree without having to write xpath!
#'
#' @param tree a html tree returned from url2tree
#' @param select a css selector to navigate to, e.g. 'class="keyword"'. This can also be a node attribute, e.g. 'cellpadding="1"'. Make sure to include double quotes around the value associated with the class/id.
#' @param children OPTIONAL subsequent children nodes to navigate to. e.g. "a", "ul/li/a" etc.
#'
#' @return
#' a list of nodes matching the constructed xpath expression
#'
#' @export
#'
#' @examples
#' # see example in the README
tree2node <- function(tree, select, children=NULL) {
    if(!is.null(children)){
        children <- paste0("/", children)
    }
    xpath <- paste0('//*[@', select,']', children)
    getNodeSet(tree, xpath)
}