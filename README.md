# scraply#
##_error-proof scraping in R_##
``scraply`` is a tool for writing error-proof scrapers quickly and easily in R.
Its primary purpose is to apply a scraping function across a list of urls while handling and logging errors.

### contact: ###
[@brianabelson](http://www.twitter.com/brianabelson)

####install scraply:####

    library("devtools")
    install_github("scraply", "abelsonlive")
    library("scraply")

####scraply in action:####

1. First we're going to write a function to parse one html tree. In this case, we want to get all the keywords associated with a movie on imdb.com given its imdb id.
    ```
    imdb_keywords <- function(tree) {
        # tree2node constructs an xpath query (in this case: '//*[@class="keyword"]/a')
        # and then runs it through getNodeSet in the 'XML' package
        nodes <- tree2node(tree, select='class="keyword"', children="a")

        # ahref extracts the link and text associated with an "a" tag.
        # we use ldply here to apply ahref across all the nodes of "a" tags that we've extracted.
        keywords <- ldply(nodes, ahref)
        return(keywords)
    }
    ```
2. Now we're going to use ``scraply`` to run this scraper across multiple urls. We're going to purposefully insert erroneous urls to see how ``scraply`` handles these cases.
    ```
    imdb_ids <- c("tt0057012", "tt0000000", "tt0083946", "tt0089881", "NOT AN IMDB ID")
    urls <- paste0("http://www.imdb.com/title/", imdb_ids, "/keywords")
    imdb_keywords <- function(tree) {
        nodes <- tree2node(tree, select='class="keyword"', children="a")
        keywords <- ldply(nodes, ahref)
        return(keywords)
    }
    data <- scraply(urls, imdb_keywords, sleep=0.1)

    # check errors
    data[data$error==1,]
    ```
3. Now lets put it all together!
    ```
    library("devtools")
    install_github("scraply", "abelsonlive")
    library("scraply")

    imdb_ids <- c("tt0057012", "tt0000000", "tt0083946", "tt0089881", "NOT AN IMDB ID")
    urls <- paste0("http://www.imdb.com/title/", imdb_ids, "/keywords")
    
    imdb_keywords <- function(tree) {
        nodes <- tree2node(tree, select='class="keyword"', children="a")
        keywords <- ldply(nodes, ahref)
        return(keywords)
    }

    data <- scraply(urls, imdb_keywords, sleep=0.1)
    data[data$error==1,]
    # can you guess what these movies are???
    data[data$error==0,]
    ```
4. Run ``scraply`` on Amazon's EMR:
    ```
    library("devtools")
    install_github("scraply", "abelsonlive")
    library("scraply")
    library("segue")
    setCredentials("AWS_ACCESS_KEY_ID", "AWS_SECRET_ACCESS_KEY")
    myCluster <- createCluster(2)

    imdb_keywords <- function(tree) {
        nodes <- tree2node(tree, select='class="keyword"', children="a")
        keywords <- ldply(nodes, ahref)
        return(keywords)
    }

    imdb_ids <- c("tt0057012", "tt0000000", "tt0083946", "tt0089881", "NOT AN IMDB ID")
    data <- scraply(imdb_ids, imdb_keywords, sleep=0.1, emr=TRUE, clusterObject=myCluster)
    stopCluster(myCluster)
    ```

### notes: ###
* scraply is in active development and many more features and functions are in the works.
* suggestions / forks / pull requests encouraged!

### todo: ###
* add feature which allows iterative dumping into a database or to csv files.
* figure out how to better announce errors as they are occuring.
