
# cfhttr

Workaround Cloudflare Anti-DDoS Protection

## Description

Some sites use Cloudflare’s anti-DDoS protection to, well, avoid being
DDoS’d.

However, many of these sites also host files that they intended for
automated download workflows and often forget to exclude those from the
heavy-handed anti-DDoS, javascript + human-required settings.

Cloudflare employs a few different anti-DDoS protection schemes. One
involves a 503 HTTP response followed by the submission of a “challenge”
that was solved via a bit of javascript on the page. *That’s what this
pacakge handles.* If you encounter other Cloudflare anti-DDoS protection
schemes (especially the captcha one), then this won’t work.

## NOTE

If this ceases to work it likely means that Cloudflare changed the
challenge code. Please [file an
issue](https://github.com/hrbrmstr/cfhttr/issues) so I can redo the
workaround.

## What’s Inside The Tin

The following functions are implemented:

  - `cf_GET`: Cloudflare bypass version of `httr::GET()`

## Installation

``` r
devtools::install_github("hrbrmstr/cfhttr")
```

## Usage

``` r
library(cfhttr)

# current verison
packageVersion("cfhttr")
```

    ## [1] '0.1.0'

``` r
res <- cf_GET("https://www.bitmarket.pl/graphs/BTCPLN/90m.json")
```

    ## Waiting 5 seconds...

``` r
str(httr::content(res, as="parsed"))
```

    ## List of 90
    ##  $ :List of 6
    ##   ..$ time : int 1512908160
    ##   ..$ open : chr "48000.00000000"
    ##   ..$ high : chr "48100.00000000"
    ##   ..$ low  : chr "48000.00000000"
    ##   ..$ close: chr "48100.00000000"
    ##   ..$ vol  : chr "0.00124821"
    ##  $ :List of 6
    ##   ..$ time : int 1512908220
    ##   ..$ open : chr "48100.00000000"
    ##   ..$ high : chr "48100.00000000"
    ##   ..$ low  : chr "48100.00000000"
    ##   ..$ close: chr "48100.00000000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512908280
    ##   ..$ open : chr "48100.00000000"
    ##   ..$ high : chr "48100.00000000"
    ##   ..$ low  : chr "48100.00000000"
    ##   ..$ close: chr "48100.00000000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512908340
    ##   ..$ open : chr "48100.00000000"
    ##   ..$ high : chr "48100.00000000"
    ##   ..$ low  : chr "48000.00000000"
    ##   ..$ close: chr "48000.00000000"
    ##   ..$ vol  : chr "0.01757887"
    ##  $ :List of 6
    ##   ..$ time : int 1512908400
    ##   ..$ open : chr "48000.00000000"
    ##   ..$ high : chr "48100.00000000"
    ##   ..$ low  : chr "48000.00000000"
    ##   ..$ close: chr "48100.00000000"
    ##   ..$ vol  : chr "0.09891712"
    ##  $ :List of 6
    ##   ..$ time : int 1512908460
    ##   ..$ open : chr "48100.00000000"
    ##   ..$ high : chr "48100.00000000"
    ##   ..$ low  : chr "48100.00000000"
    ##   ..$ close: chr "48100.00000000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512908520
    ##   ..$ open : chr "48100.00000000"
    ##   ..$ high : chr "48308.22960000"
    ##   ..$ low  : chr "48100.00000000"
    ##   ..$ close: chr "48308.22960000"
    ##   ..$ vol  : chr "0.01972749"
    ##  $ :List of 6
    ##   ..$ time : int 1512908580
    ##   ..$ open : chr "48308.22960000"
    ##   ..$ high : chr "48308.22960000"
    ##   ..$ low  : chr "48000.00000000"
    ##   ..$ close: chr "48000.00000000"
    ##   ..$ vol  : chr "0.01555715"
    ##  $ :List of 6
    ##   ..$ time : int 1512908640
    ##   ..$ open : chr "48000.00000000"
    ##   ..$ high : chr "48149.99960000"
    ##   ..$ low  : chr "47700.00000000"
    ##   ..$ close: chr "48149.99960000"
    ##   ..$ vol  : chr "0.26652673"
    ##  $ :List of 6
    ##   ..$ time : int 1512908700
    ##   ..$ open : chr "48149.99960000"
    ##   ..$ high : chr "48149.99960000"
    ##   ..$ low  : chr "48149.98960000"
    ##   ..$ close: chr "48149.98960000"
    ##   ..$ vol  : chr "0.02755044"
    ##  $ :List of 6
    ##   ..$ time : int 1512908760
    ##   ..$ open : chr "48149.98960000"
    ##   ..$ high : chr "48149.98960000"
    ##   ..$ low  : chr "48149.98960000"
    ##   ..$ close: chr "48149.98960000"
    ##   ..$ vol  : chr "0.02202285"
    ##  $ :List of 6
    ##   ..$ time : int 1512908820
    ##   ..$ open : chr "48149.98960000"
    ##   ..$ high : chr "48149.98960000"
    ##   ..$ low  : chr "48144.99960000"
    ##   ..$ close: chr "48144.99960000"
    ##   ..$ vol  : chr "0.03115266"
    ##  $ :List of 6
    ##   ..$ time : int 1512908880
    ##   ..$ open : chr "48144.99960000"
    ##   ..$ high : chr "48145.00000000"
    ##   ..$ low  : chr "48144.99960000"
    ##   ..$ close: chr "48145.00000000"
    ##   ..$ vol  : chr "0.05214570"
    ##  $ :List of 6
    ##   ..$ time : int 1512908940
    ##   ..$ open : chr "48145.00000000"
    ##   ..$ high : chr "48145.00000000"
    ##   ..$ low  : chr "48145.00000000"
    ##   ..$ close: chr "48145.00000000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512909000
    ##   ..$ open : chr "48145.00000000"
    ##   ..$ high : chr "48145.00000000"
    ##   ..$ low  : chr "48145.00000000"
    ##   ..$ close: chr "48145.00000000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512909060
    ##   ..$ open : chr "48145.00000000"
    ##   ..$ high : chr "48152.00000000"
    ##   ..$ low  : chr "48145.00000000"
    ##   ..$ close: chr "48152.00000000"
    ##   ..$ vol  : chr "0.14385430"
    ##  $ :List of 6
    ##   ..$ time : int 1512909120
    ##   ..$ open : chr "48152.00000000"
    ##   ..$ high : chr "48200.00000000"
    ##   ..$ low  : chr "48152.00000000"
    ##   ..$ close: chr "48200.00000000"
    ##   ..$ vol  : chr "0.05931535"
    ##  $ :List of 6
    ##   ..$ time : int 1512909180
    ##   ..$ open : chr "48200.00000000"
    ##   ..$ high : chr "48287.99960000"
    ##   ..$ low  : chr "48200.00000000"
    ##   ..$ close: chr "48287.99960000"
    ##   ..$ vol  : chr "0.02196575"
    ##  $ :List of 6
    ##   ..$ time : int 1512909240
    ##   ..$ open : chr "48287.99960000"
    ##   ..$ high : chr "48287.99960000"
    ##   ..$ low  : chr "48145.00000000"
    ##   ..$ close: chr "48287.99960000"
    ##   ..$ vol  : chr "0.84227748"
    ##  $ :List of 6
    ##   ..$ time : int 1512909300
    ##   ..$ open : chr "48287.99960000"
    ##   ..$ high : chr "48287.99960000"
    ##   ..$ low  : chr "48144.99960000"
    ##   ..$ close: chr "48144.99960000"
    ##   ..$ vol  : chr "0.01528501"
    ##  $ :List of 6
    ##   ..$ time : int 1512909360
    ##   ..$ open : chr "48144.99960000"
    ##   ..$ high : chr "48144.99960000"
    ##   ..$ low  : chr "47633.00040000"
    ##   ..$ close: chr "48144.99960000"
    ##   ..$ vol  : chr "0.38813920"
    ##  $ :List of 6
    ##   ..$ time : int 1512909420
    ##   ..$ open : chr "48144.99960000"
    ##   ..$ high : chr "48287.98960000"
    ##   ..$ low  : chr "48144.99960000"
    ##   ..$ close: chr "48144.99960000"
    ##   ..$ vol  : chr "0.03962696"
    ##  $ :List of 6
    ##   ..$ time : int 1512909480
    ##   ..$ open : chr "48144.99960000"
    ##   ..$ high : chr "48144.99960000"
    ##   ..$ low  : chr "48144.99960000"
    ##   ..$ close: chr "48144.99960000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512909540
    ##   ..$ open : chr "48144.99960000"
    ##   ..$ high : chr "48308.24000000"
    ##   ..$ low  : chr "48144.99960000"
    ##   ..$ close: chr "48308.24000000"
    ##   ..$ vol  : chr "0.24594488"
    ##  $ :List of 6
    ##   ..$ time : int 1512909600
    ##   ..$ open : chr "48308.24000000"
    ##   ..$ high : chr "48388.25000000"
    ##   ..$ low  : chr "48308.24000000"
    ##   ..$ close: chr "48388.25000000"
    ##   ..$ vol  : chr "2.45037261"
    ##  $ :List of 6
    ##   ..$ time : int 1512909660
    ##   ..$ open : chr "48388.25000000"
    ##   ..$ high : chr "48400.00000000"
    ##   ..$ low  : chr "48388.25000000"
    ##   ..$ close: chr "48400.00000000"
    ##   ..$ vol  : chr "0.02294538"
    ##  $ :List of 6
    ##   ..$ time : int 1512909720
    ##   ..$ open : chr "48400.00000000"
    ##   ..$ high : chr "48400.00000000"
    ##   ..$ low  : chr "48400.00000000"
    ##   ..$ close: chr "48400.00000000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512909780
    ##   ..$ open : chr "48400.00000000"
    ##   ..$ high : chr "48400.00000000"
    ##   ..$ low  : chr "48400.00000000"
    ##   ..$ close: chr "48400.00000000"
    ##   ..$ vol  : chr "0.00393802"
    ##  $ :List of 6
    ##   ..$ time : int 1512909840
    ##   ..$ open : chr "48400.00000000"
    ##   ..$ high : chr "48400.00000000"
    ##   ..$ low  : chr "48309.00000000"
    ##   ..$ close: chr "48400.00000000"
    ##   ..$ vol  : chr "0.00980329"
    ##  $ :List of 6
    ##   ..$ time : int 1512909900
    ##   ..$ open : chr "48400.00000000"
    ##   ..$ high : chr "48400.00000000"
    ##   ..$ low  : chr "48400.00000000"
    ##   ..$ close: chr "48400.00000000"
    ##   ..$ vol  : chr "0.00303943"
    ##  $ :List of 6
    ##   ..$ time : int 1512909960
    ##   ..$ open : chr "48400.00000000"
    ##   ..$ high : chr "48422.00000000"
    ##   ..$ low  : chr "48400.00000000"
    ##   ..$ close: chr "48422.00000000"
    ##   ..$ vol  : chr "0.04130911"
    ##  $ :List of 6
    ##   ..$ time : int 1512910020
    ##   ..$ open : chr "48422.00000000"
    ##   ..$ high : chr "48422.00000000"
    ##   ..$ low  : chr "48422.00000000"
    ##   ..$ close: chr "48422.00000000"
    ##   ..$ vol  : chr "0.00600141"
    ##  $ :List of 6
    ##   ..$ time : int 1512910080
    ##   ..$ open : chr "48422.00000000"
    ##   ..$ high : chr "48422.00000000"
    ##   ..$ low  : chr "48422.00000000"
    ##   ..$ close: chr "48422.00000000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512910140
    ##   ..$ open : chr "48422.00000000"
    ##   ..$ high : chr "48422.00000000"
    ##   ..$ low  : chr "48350.00040000"
    ##   ..$ close: chr "48350.00040000"
    ##   ..$ vol  : chr "0.00206979"
    ##  $ :List of 6
    ##   ..$ time : int 1512910200
    ##   ..$ open : chr "48350.00040000"
    ##   ..$ high : chr "48350.00040000"
    ##   ..$ low  : chr "48350.00040000"
    ##   ..$ close: chr "48350.00040000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512910260
    ##   ..$ open : chr "48350.00040000"
    ##   ..$ high : chr "48351.00040000"
    ##   ..$ low  : chr "48350.00040000"
    ##   ..$ close: chr "48351.00040000"
    ##   ..$ vol  : chr "0.01231852"
    ##  $ :List of 6
    ##   ..$ time : int 1512910320
    ##   ..$ open : chr "48351.00040000"
    ##   ..$ high : chr "48500.00000000"
    ##   ..$ low  : chr "48351.00040000"
    ##   ..$ close: chr "48500.00000000"
    ##   ..$ vol  : chr "1.08695121"
    ##  $ :List of 6
    ##   ..$ time : int 1512910380
    ##   ..$ open : chr "48500.00000000"
    ##   ..$ high : chr "48500.00000000"
    ##   ..$ low  : chr "48401.00000000"
    ##   ..$ close: chr "48500.00000000"
    ##   ..$ vol  : chr "0.18221694"
    ##  $ :List of 6
    ##   ..$ time : int 1512910440
    ##   ..$ open : chr "48500.00000000"
    ##   ..$ high : chr "49196.40000000"
    ##   ..$ low  : chr "48500.00000000"
    ##   ..$ close: chr "48600.00000000"
    ##   ..$ vol  : chr "2.59367364"
    ##  $ :List of 6
    ##   ..$ time : int 1512910500
    ##   ..$ open : chr "48600.00000000"
    ##   ..$ high : chr "49249.18000000"
    ##   ..$ low  : chr "48600.00000000"
    ##   ..$ close: chr "49249.18000000"
    ##   ..$ vol  : chr "4.06697086"
    ##  $ :List of 6
    ##   ..$ time : int 1512910560
    ##   ..$ open : chr "49249.18000000"
    ##   ..$ high : chr "49500.00000000"
    ##   ..$ low  : chr "49217.94000000"
    ##   ..$ close: chr "49500.00000000"
    ##   ..$ vol  : chr "2.35015523"
    ##  $ :List of 6
    ##   ..$ time : int 1512910620
    ##   ..$ open : chr "49500.00000000"
    ##   ..$ high : chr "49500.00000000"
    ##   ..$ low  : chr "49500.00000000"
    ##   ..$ close: chr "49500.00000000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512910680
    ##   ..$ open : chr "49500.00000000"
    ##   ..$ high : chr "49500.00000000"
    ##   ..$ low  : chr "49500.00000000"
    ##   ..$ close: chr "49500.00000000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512910740
    ##   ..$ open : chr "49500.00000000"
    ##   ..$ high : chr "49500.00000000"
    ##   ..$ low  : chr "49500.00000000"
    ##   ..$ close: chr "49500.00000000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512910800
    ##   ..$ open : chr "49500.00000000"
    ##   ..$ high : chr "49500.00000000"
    ##   ..$ low  : chr "49000.00010000"
    ##   ..$ close: chr "49000.00010000"
    ##   ..$ vol  : chr "0.00700000"
    ##  $ :List of 6
    ##   ..$ time : int 1512910860
    ##   ..$ open : chr "49000.00010000"
    ##   ..$ high : chr "49000.00010000"
    ##   ..$ low  : chr "48568.51000000"
    ##   ..$ close: chr "48568.51000000"
    ##   ..$ vol  : chr "0.10409977"
    ##  $ :List of 6
    ##   ..$ time : int 1512910920
    ##   ..$ open : chr "48568.51000000"
    ##   ..$ high : chr "49000.00000000"
    ##   ..$ low  : chr "48568.51000000"
    ##   ..$ close: chr "49000.00000000"
    ##   ..$ vol  : chr "0.00876630"
    ##  $ :List of 6
    ##   ..$ time : int 1512910980
    ##   ..$ open : chr "49000.00000000"
    ##   ..$ high : chr "49000.00000000"
    ##   ..$ low  : chr "49000.00000000"
    ##   ..$ close: chr "49000.00000000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512911040
    ##   ..$ open : chr "49000.00000000"
    ##   ..$ high : chr "49000.00000000"
    ##   ..$ low  : chr "49000.00000000"
    ##   ..$ close: chr "49000.00000000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512911100
    ##   ..$ open : chr "49000.00000000"
    ##   ..$ high : chr "49000.00000000"
    ##   ..$ low  : chr "49000.00000000"
    ##   ..$ close: chr "49000.00000000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512911160
    ##   ..$ open : chr "49000.00000000"
    ##   ..$ high : chr "49000.00000000"
    ##   ..$ low  : chr "48601.00040000"
    ##   ..$ close: chr "48997.99790000"
    ##   ..$ vol  : chr "0.11534381"
    ##  $ :List of 6
    ##   ..$ time : int 1512911220
    ##   ..$ open : chr "48997.99790000"
    ##   ..$ high : chr "49000.00010000"
    ##   ..$ low  : chr "48997.99780000"
    ##   ..$ close: chr "49000.00010000"
    ##   ..$ vol  : chr "0.01923370"
    ##  $ :List of 6
    ##   ..$ time : int 1512911280
    ##   ..$ open : chr "49000.00010000"
    ##   ..$ high : chr "49500.00000000"
    ##   ..$ low  : chr "49000.00010000"
    ##   ..$ close: chr "49479.99890000"
    ##   ..$ vol  : chr "0.71785275"
    ##  $ :List of 6
    ##   ..$ time : int 1512911340
    ##   ..$ open : chr "49479.99890000"
    ##   ..$ high : chr "49499.99000000"
    ##   ..$ low  : chr "49400.00000000"
    ##   ..$ close: chr "49499.97960000"
    ##   ..$ vol  : chr "0.11959698"
    ##  $ :List of 6
    ##   ..$ time : int 1512911400
    ##   ..$ open : chr "49499.97960000"
    ##   ..$ high : chr "49499.97960000"
    ##   ..$ low  : chr "49226.54000000"
    ##   ..$ close: chr "49226.54000000"
    ##   ..$ vol  : chr "0.05980584"
    ##  $ :List of 6
    ##   ..$ time : int 1512911460
    ##   ..$ open : chr "49226.54000000"
    ##   ..$ high : chr "49226.54000000"
    ##   ..$ low  : chr "49226.54000000"
    ##   ..$ close: chr "49226.54000000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512911520
    ##   ..$ open : chr "49226.54000000"
    ##   ..$ high : chr "49226.54000000"
    ##   ..$ low  : chr "49226.54000000"
    ##   ..$ close: chr "49226.54000000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512911580
    ##   ..$ open : chr "49226.54000000"
    ##   ..$ high : chr "49281.46000000"
    ##   ..$ low  : chr "49226.54000000"
    ##   ..$ close: chr "49281.46000000"
    ##   ..$ vol  : chr "0.02925124"
    ##  $ :List of 6
    ##   ..$ time : int 1512911640
    ##   ..$ open : chr "49281.46000000"
    ##   ..$ high : chr "49499.98000000"
    ##   ..$ low  : chr "49281.46000000"
    ##   ..$ close: chr "49397.84040000"
    ##   ..$ vol  : chr "0.13054768"
    ##  $ :List of 6
    ##   ..$ time : int 1512911700
    ##   ..$ open : chr "49397.84040000"
    ##   ..$ high : chr "49550.00000000"
    ##   ..$ low  : chr "49397.84040000"
    ##   ..$ close: chr "49550.00000000"
    ##   ..$ vol  : chr "1.19534515"
    ##  $ :List of 6
    ##   ..$ time : int 1512911760
    ##   ..$ open : chr "49550.00000000"
    ##   ..$ high : chr "50101.00000000"
    ##   ..$ low  : chr "49550.00000000"
    ##   ..$ close: chr "50101.00000000"
    ##   ..$ vol  : chr "5.57556584"
    ##  $ :List of 6
    ##   ..$ time : int 1512911820
    ##   ..$ open : chr "50101.00000000"
    ##   ..$ high : chr "50101.00000000"
    ##   ..$ low  : chr "49575.45000000"
    ##   ..$ close: chr "49575.45000000"
    ##   ..$ vol  : chr "0.14549902"
    ##  $ :List of 6
    ##   ..$ time : int 1512911880
    ##   ..$ open : chr "49575.45000000"
    ##   ..$ high : chr "49899.00000000"
    ##   ..$ low  : chr "49575.45000000"
    ##   ..$ close: chr "49899.00000000"
    ##   ..$ vol  : chr "0.04075380"
    ##  $ :List of 6
    ##   ..$ time : int 1512911940
    ##   ..$ open : chr "49899.00000000"
    ##   ..$ high : chr "49899.00000000"
    ##   ..$ low  : chr "49602.00000000"
    ##   ..$ close: chr "49602.00000000"
    ##   ..$ vol  : chr "0.00402226"
    ##  $ :List of 6
    ##   ..$ time : int 1512912000
    ##   ..$ open : chr "49602.00000000"
    ##   ..$ high : chr "49898.99990000"
    ##   ..$ low  : chr "49602.00000000"
    ##   ..$ close: chr "49800.00000000"
    ##   ..$ vol  : chr "0.07934697"
    ##  $ :List of 6
    ##   ..$ time : int 1512912060
    ##   ..$ open : chr "49800.00000000"
    ##   ..$ high : chr "49800.00000000"
    ##   ..$ low  : chr "49800.00000000"
    ##   ..$ close: chr "49800.00000000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512912120
    ##   ..$ open : chr "49800.00000000"
    ##   ..$ high : chr "49800.00000000"
    ##   ..$ low  : chr "49800.00000000"
    ##   ..$ close: chr "49800.00000000"
    ##   ..$ vol  : chr "0.00956827"
    ##  $ :List of 6
    ##   ..$ time : int 1512912180
    ##   ..$ open : chr "49800.00000000"
    ##   ..$ high : chr "49800.00000000"
    ##   ..$ low  : chr "49800.00000000"
    ##   ..$ close: chr "49800.00000000"
    ##   ..$ vol  : chr "0.03320662"
    ##  $ :List of 6
    ##   ..$ time : int 1512912240
    ##   ..$ open : chr "49800.00000000"
    ##   ..$ high : chr "49800.00000000"
    ##   ..$ low  : chr "49800.00000000"
    ##   ..$ close: chr "49800.00000000"
    ##   ..$ vol  : chr "0.00000000"
    ##  $ :List of 6
    ##   ..$ time : int 1512912300
    ##   ..$ open : chr "49800.00000000"
    ##   ..$ high : chr "50000.00000000"
    ##   ..$ low  : chr "49615.72040000"
    ##   ..$ close: chr "50000.00000000"
    ##   ..$ vol  : chr "1.08394998"
    ##  $ :List of 6
    ##   ..$ time : int 1512912360
    ##   ..$ open : chr "50000.00000000"
    ##   ..$ high : chr "50151.07000000"
    ##   ..$ low  : chr "50000.00000000"
    ##   ..$ close: chr "50151.07000000"
    ##   ..$ vol  : chr "2.51657327"
    ##  $ :List of 6
    ##   ..$ time : int 1512912420
    ##   ..$ open : chr "50151.07000000"
    ##   ..$ high : chr "50280.00000000"
    ##   ..$ low  : chr "50000.00000000"
    ##   ..$ close: chr "50280.00000000"
    ##   ..$ vol  : chr "1.24144728"
    ##  $ :List of 6
    ##   ..$ time : int 1512912480
    ##   ..$ open : chr "50280.00000000"
    ##   ..$ high : chr "50316.00000000"
    ##   ..$ low  : chr "50280.00000000"
    ##   ..$ close: chr "50316.00000000"
    ##   ..$ vol  : chr "0.25556483"
    ##  $ :List of 6
    ##   ..$ time : int 1512912540
    ##   ..$ open : chr "50316.00000000"
    ##   ..$ high : chr "50499.69860000"
    ##   ..$ low  : chr "50062.05040000"
    ##   ..$ close: chr "50499.69860000"
    ##   ..$ vol  : chr "1.33295472"
    ##  $ :List of 6
    ##   ..$ time : int 1512912600
    ##   ..$ open : chr "50499.69860000"
    ##   ..$ high : chr "50503.48360000"
    ##   ..$ low  : chr "50499.69860000"
    ##   ..$ close: chr "50503.48360000"
    ##   ..$ vol  : chr "0.34136011"
    ##  $ :List of 6
    ##   ..$ time : int 1512912660
    ##   ..$ open : chr "50503.48360000"
    ##   ..$ high : chr "50503.48360000"
    ##   ..$ low  : chr "50503.48320000"
    ##   ..$ close: chr "50503.48320000"
    ##   ..$ vol  : chr "0.02625000"
    ##  $ :List of 6
    ##   ..$ time : int 1512912720
    ##   ..$ open : chr "50503.48320000"
    ##   ..$ high : chr "50503.48360000"
    ##   ..$ low  : chr "50300.00050000"
    ##   ..$ close: chr "50503.48360000"
    ##   ..$ vol  : chr "0.11206182"
    ##  $ :List of 6
    ##   ..$ time : int 1512912780
    ##   ..$ open : chr "50503.48360000"
    ##   ..$ high : chr "50503.48360000"
    ##   ..$ low  : chr "50503.48360000"
    ##   ..$ close: chr "50503.48360000"
    ##   ..$ vol  : chr "0.52227081"
    ##  $ :List of 6
    ##   ..$ time : int 1512912840
    ##   ..$ open : chr "50503.48360000"
    ##   ..$ high : chr "50690.90000000"
    ##   ..$ low  : chr "50350.00010000"
    ##   ..$ close: chr "50690.90000000"
    ##   ..$ vol  : chr "1.52948553"
    ##  $ :List of 6
    ##   ..$ time : int 1512912900
    ##   ..$ open : chr "50690.90000000"
    ##   ..$ high : chr "50813.91050000"
    ##   ..$ low  : chr "50690.90000000"
    ##   ..$ close: chr "50813.91050000"
    ##   ..$ vol  : chr "0.75597156"
    ##  $ :List of 6
    ##   ..$ time : int 1512912960
    ##   ..$ open : chr "50813.91050000"
    ##   ..$ high : chr "50813.91050000"
    ##   ..$ low  : chr "50800.00000000"
    ##   ..$ close: chr "50812.00000000"
    ##   ..$ vol  : chr "0.49405439"
    ##  $ :List of 6
    ##   ..$ time : int 1512913020
    ##   ..$ open : chr "50812.00000000"
    ##   ..$ high : chr "50908.24350000"
    ##   ..$ low  : chr "50812.00000000"
    ##   ..$ close: chr "50894.51000000"
    ##   ..$ vol  : chr "1.85312042"
    ##  $ :List of 6
    ##   ..$ time : int 1512913080
    ##   ..$ open : chr "50894.51000000"
    ##   ..$ high : chr "50894.51000000"
    ##   ..$ low  : chr "50620.00010000"
    ##   ..$ close: chr "50620.00010000"
    ##   ..$ vol  : chr "0.00100000"
    ##  $ :List of 6
    ##   ..$ time : int 1512913140
    ##   ..$ open : chr "50620.00010000"
    ##   ..$ high : chr "50997.00000000"
    ##   ..$ low  : chr "50620.00010000"
    ##   ..$ close: chr "50997.00000000"
    ##   ..$ vol  : chr "2.76298135"
    ##  $ :List of 6
    ##   ..$ time : int 1512913200
    ##   ..$ open : chr "50997.00000000"
    ##   ..$ high : chr "50999.00000000"
    ##   ..$ low  : chr "50997.00000000"
    ##   ..$ close: chr "50999.00000000"
    ##   ..$ vol  : chr "0.22308001"
    ##  $ :List of 6
    ##   ..$ time : int 1512913260
    ##   ..$ open : chr "50999.00000000"
    ##   ..$ high : chr "51228.31820000"
    ##   ..$ low  : chr "50999.00000000"
    ##   ..$ close: chr "51228.31820000"
    ##   ..$ vol  : chr "1.17797930"
    ##  $ :List of 6
    ##   ..$ time : int 1512913320
    ##   ..$ open : chr "51228.31820000"
    ##   ..$ high : chr "51300.00000000"
    ##   ..$ low  : chr "51228.31820000"
    ##   ..$ close: chr "51300.00000000"
    ##   ..$ vol  : chr "0.49172758"
    ##  $ :List of 6
    ##   ..$ time : int 1512913380
    ##   ..$ open : chr "51300.00000000"
    ##   ..$ high : chr "51344.22730000"
    ##   ..$ low  : chr "51200.00000000"
    ##   ..$ close: chr "51230.00000000"
    ##   ..$ vol  : chr "1.71567939"
    ##  $ :List of 6
    ##   ..$ time : int 1512913440
    ##   ..$ open : chr "51230.00000000"
    ##   ..$ high : chr "51230.00000000"
    ##   ..$ low  : chr "49835.94170000"
    ##   ..$ close: chr "49835.94170000"
    ##   ..$ vol  : chr "1.13497735"
    ##  $ :List of 6
    ##   ..$ time : int 1512913500
    ##   ..$ open : chr "49835.94170000"
    ##   ..$ high : chr "49846.00040000"
    ##   ..$ low  : chr "49835.94170000"
    ##   ..$ close: chr "49846.00040000"
    ##   ..$ vol  : chr "0.42709102"
