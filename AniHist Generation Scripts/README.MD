You can either run the .sh script in a bash shell or run the \*.exe.bat which runs the .ps1 (if they are in the same folder location).

Both of these scripts generate a line formatted in csv to be added at the top of AniHist.csv, which will then update the website's showing.html content after a few minutes.
The year is assumed to be the current year, and the semester will default to the current closest semester if you do not enter Spring or Fall (case-sensitive).
The scripts will attempt to search for the main anime page for each entered anime on ANN. 
Several commas in a row implies the anime was not found.
Outputted titles may not exactly match the title you are familiar with as this is most likely an alias/alternative title ANN has associated with that anime.
For example: *bobobo* will return *Bobobo-bo Bo-bobo*, but *bobo* will return the alias *Bo-Bobo*

Feel free to make changes to the titles if you cannot get the one you expect.
Always double check the links in the showings.html page to make sure they redirect to the proper AnimeNewsNetwork (ANN) page.
