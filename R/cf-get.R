#' Cloudflare bypass version of httr::GET
#'
#' If this ceases to work it likely means that Cloudflare changed the challenge code.
#' Please [file an issue](https://github.com/hrbrmstr/cfhttr/issues) so I can redo the
#' workaround.
#'
#' @md
#' @note This function pick a user agent at random if one isn't passed in
#' @param cf_url the URL you want
#' @param cf_agent user agent you want to use. if `NULL` a valid one is chosen at random
#' @param ... other params passed to all `httr::GET` calls (other headers, verbose, etc)
#' @return `httr::response object`
#' @export
#' @examples
#' res <- cf_GET("https://www.bitmarket.pl/graphs/BTCPLN/90m.json")
#' str(httr::content(res, as="parsed"))
cf_GET <- function(cf_url, cf_agent=NULL, ...) {

  # use a valid browser user-agent but don't always use the same one
  if (is.null(cf_agent)) cf_agent <- unname(sample(.cf_agents, 1))

  httr::GET(
    url = cf_url,
    httr::user_agent(cf_agent),
    ...
  ) -> res

  # sometimes you get lucky and the page comes back
  if (!httr::status_code(res) == 503) return(res) # return now if no cf redirect
  if (res$headers$server != "cloudflare-nginx") {
    message("This doesn't _look_ like a cloudflare-protected site, but giving it a go anyway")
  }

  # get the page
  cf_pg <- httr::content(res, as="parsed")

  # => leaving in the parens evaluation for easier debugging (it doesn't hurt the operation)

  # get form/form variables we'll need later
  (jschl_vc <- html_attr(html_node(cf_pg, "input[name='jschl_vc']"), "value"))

  # Canna do it cap'n
  if (is.na(jschl_vc)) stop("Cannot handle this protection scheme", call.=FALSE)

  (pass <- html_attr(html_node(cf_pg, "input[name='pass']"), "value"))
  (action <- html_attr(html_node(cf_pg, "form[id='challenge-form']"), "action"))

  # get the page as just lines of text
  cf_code <- httr::content(res, as="text")
  writeLines(cf_code, "/tmp/a.html")
  cf_code <- stri_split_lines(cf_code)[[1]]

  # find the javascript
  decl <- cf_code[which(stri_detect_fixed(cf_code, "s,t,o,p,b"))]
  (init_line <- stri_match_first_regex(decl, "s,t,o,p,b[[:alpha:], ]+ (.*$)")[,2])
  (var_name <- stri_match_first_regex(init_line, "([[:alnum:]]+)")[,2])
  (exec_line <- cf_code[which(stri_detect_fixed(cf_code, var_name))[2]])

  # tweak and execute the javascript
  ctx <- v8()
  ctx$eval(sprintf("var a = {}; t = '%s';%s\n%s", domain(cf_url), decl, exec_line))
  (ctx$get("a.value"))

  # this lying but you can wait 10s
  message("Waiting 5 seconds...")
  Sys.sleep(10)

  # solve the DDoS challenge and make the request
  httr::GET(
    url = sprintf("%s://%s/%s", scheme(cf_url), domain(cf_url), action),
    httr::user_agent(cf_agent),
    httr::add_headers(
      `Referer` = cf_url
    ),
    query = list(
      `jschl-answer` = ctx$get("a.value"),
      jschl_vc = jschl_vc,
      pass = pass
    ),
    ...
  ) -> res

  res

}

