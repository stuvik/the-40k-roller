I created this tool because, despite rolling dice on the table in a 40K game, the dice can inadvertently bump the miniatures out of position. In serious tournaments can lead to unfair advantages/disadvantages and calls of cheating...

...that and I haven't bought enough dice yet :P

  * You can choose to roll up to 60 dice per roll with up to 100 faces/die
  * Each roll has grouped result listing so it's simple to count your dice :)
  * There's also a very simple history of rolls made

Coded in Delphi 7 (Pro) using standard [core](core.md) components and a freely available 3rd party unit for pseudo-random number generation. Currently there is no database back end to the functionality however this may change over time to a (D7 compatible) freeware embedded database engine of some description.

**More features to come!**
  * Reset history and stats _(for multiple games without restarting the application)_
  * Increased roll history details
    * time between rolls
    * total # rolls
    * total occurances of die results
  * Roller profiles
    * will likely mean a rewrite to utilize a DB back end


