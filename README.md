# Grid Unlock, Part 2

The efficiency data is made with the [same dumb- and smart-walk simulator used in the original experiment](https://github.com/PerplexCity/Grid-Unlock/blob/master/squarewalks.py), but [this time](https://github.com/PerplexCity/Grid-Unlock-2/blob/master/newsquare.py) you just feed a variable in for the size of the grid. You can get the results for [every graph size from 1x1 to 50x50](https://github.com/PerplexCity/Grid-Unlock-2/blob/master/allgrids.csv), or you can set your parameters to [powers of 2](https://github.com/PerplexCity/Grid-Unlock-2/blob/master/twowox.csv).

Once you have the data, [inf_grid_graphs.R](https://github.com/PerplexCity/Grid-Unlock-2/blob/master/inf_grid_graphs.R) will create the efficiency graph, the graph that shows the approaching limit of 0.333, and also the images of the distributions required for the two gifs. Those don't read any data but rather calculate the relative frequencies using R's built in binomial functions.
