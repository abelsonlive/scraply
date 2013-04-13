library("devtools")
install_github("scraply", "abelsonlive")
library("scraply")

imdb_keywords <- function(imdb_id) {
    the_url <- paste0("http://www.imdb.com/title/", imdb_id, "/keywords")
    tree <- url2tree(the_url)
    nodes <- tree2node(tree, select='class="keyword"', children="a")
    keywords <- ldply(nodes, ahref)
    return(keywords)
}

imdb_ids <- c("tt0057012", "tt0000000", "tt0083946", "tt0089881", "NOT AN IMDB ID")
data <- scraply(imdb_ids, imdb_keywords, sleep=0.1)
data[data$error==1,]
# can you guess what these movies are???
data[data$error==0,]
