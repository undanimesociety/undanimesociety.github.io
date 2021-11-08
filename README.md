HOWTO:
- Update showings by adding to the top of AniHist.csv
<br />

TODO:
- Attempt update of jQuery to remove developer console warning.
  - If this does not work, find alternate request method to get csv files.
  - Solution: 
    - ```
      Deprecation Notice: The jqXHR.success(), jqXHR.error(), and jqXHR.complete() callbacks are removed as 
      of jQuery 3.0. You can use jqXHR.done(), jqXHR.fail(), and jqXHR.always() instead.
      ```
- Add templates for current available webpages.
- Create simple webpage to generate newsHist.csv lines from input.
- Dynamically pull first news item into What's New page (news.html)
- add/make sure a non-dynamic announcement section is present in news.html
- centralize common CSS styles
<br />

DONE:
- ~~convert old news (archive.html) into similar format as showing.html for dynamically loaded content~~
- ~~create script to automatically pull anime page information from ANN and generate a csv line to add to AniHist.csv~~
  - ~~example: https://www.animenewsnetwork.com/encyclopedia/search/name?q=a+certain+scientific+railgun~~
  - ~~look for and parse:  <br/>`anime <a href="/encyclopedia/anime.php?id=10706"><b>A</b> <b>Certain</b> <b>Scientific</b> <b>Railgun</b><i> (TV)</i></a><br>`~~
