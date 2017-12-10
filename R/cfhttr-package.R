#' Workaround Cloudflare Anti-DDoS Protection
#'
#' Some sites use Cloudflare's anti-DDoS protection to, well, avoid being DDoS'd.
#'
#' However, many of these sites also host files that they intended for automated download
#' workflows and often forget to exclude those from the heavy-handed anti-DDoS, javascript
#' + human-required settings.
#'
#' Cloudflare employs a few different anti-DDoS protection schemes. One involves a 503
#' HTTP response followed by the submission of a "challenge" that was solved via a bit of
#' javascript on the page. _That's what this pacakge handles._ If you encounter other
#' Cloudflare anti-DDoS protection schemes (especially the captcha one), then this won't
#' work.
#'
#' @name cfhttr
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @importFrom urltools domain scheme
#' @import stringi httr V8 rvest
NULL
