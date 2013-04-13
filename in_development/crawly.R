#' Scrape urls with llply, handling errors and iteratively dumping to csv
#'
#' IN DEVELOPMENT
#' This function is a shell for applying two functions:
#' The first, "gen_urls" creates a list of urls to scrape given a seed, i.e "A" in LETTERS
#' The second, "scrape" scrapes each of thes urls.
#' This function generates the urls, scrapes them, and dumps one csv to file per seed.
#'
#' @param root to document
#' @param url_fx to document
#' @param link_fx to document
#' @param page_fx to document
#' @param dump_urls to document
#' @param dump_sub_urls to document
#' @param dump_pages to document
#' @param steps to document
#' @param name to document
#' @param dir to document
#'
#' @export
#'
#' @return
#' a data.frame created by scrape
crawly <- function(root,
                   url_fx = create_urls,
                   link_fx = extract_links,
                   page_fx = scrape_page,
                   dump_urls = TRUE,
                   dump_sub_urls = TRUE,
                   dump_pages = FALSE,
                   steps = 10,
                   name = "crawl",
                   dir=getwd()
                   ) {
    # start
    start <- Sys.time()
    print( paste( "starting crawly", start ) )

    # initialize crawl prj directory
    setwd(dir)
    system(paste("mkdir", mame))
    setwd(name)

    #libraries
    if(!require("plyr") ) {
        install.packages("plyr")
        library("plyr")
    }

    # create function wrapper
    f <- function(x, fx) {
            f <- match.fun(fx)
            f(x)
    }

    # if implicitly requested, apply url generation function
    if(length(root)==1) {
        urls <- f(root, url_fx)
        if (dump_urls) {
            system("mkdir urls")
            write(urls, paste0("urls/", name, "_urls.txt"))
        }
    }

    # extract sub urls
    if (dump_sub_urls) {
        system("mkdir sub_urls")
        dir <- "sub_urls"
    }
    links <- scraply(urls,
                     fx = function(x) { f(x, link_fx) },
                     dump=dump_sub_urls,
                     dir=dir,
                     steps=1,
                     name=name)


    # scrape pages
    if (dump_pages) {
        system("mkdir pages")
        dir <- "pages"
    }
    pages <- scraply(sub_urls,
                     fx = function(x) { f(x, page_fx) },
                     dump=dump_pages,
                     steps = steps,
                     dir=dir,
                     name=name)


    # CALCULATE JOB LENGTH
    end <- Sys.time()
    job_length <- round(difftime(end, start, units="mins"), digits=2)
    msg1 <- paste("crawly finished at:", end)
    msg2 <- paste("job took:", job_length, "minutes")
    the_msg <- paste(msg1, cat("/n"),  msg2)
    end <- Sys.time()

    # depending on the type of function, end accordinlgy:
    if (steps == 1) {
        print(the_msg)
        return(pages)
    } else {
        print(the_msg)
        print(paste("there are", steps, "files now in", paste0(name, "/", dir)))
        stop("goodbye!")
    }
}