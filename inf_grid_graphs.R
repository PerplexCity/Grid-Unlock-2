library(ggplot2)
allgrids <- read.csv("~/Desktop/allgrids.csv")
bbi<-element_text(face="bold.italic", color="black")
ggplot(allgrids, aes(x=x, y=y)) + 
  geom_point(aes(size=100*allgrids$eff), col="steelblue") + 
  scale_size_continuous(range = c(-2, 3.5), breaks=c(5, 10, 20, 30), 
                        labels = c("5%", "10%", "20%", "30%")) + 
  theme(title=bbi) + 
  xlab("Horizontal Blocks") + ylab("Vertical Blocks") + 
  labs(title="Smart Walk Efficiency by Grid Size") +
  guides(size = guide_legend(title="Efficiency"))

twowox <- read.csv("~/Desktop/twowox.csv")
ggplot(twowox, aes(x=side.length, y=eff)) +
  geom_point(col="steelblue", size=3) +
  theme(title=bbi) + 
  xlab("Side length") + ylab("Efficiency") + 
  labs(title="Smart Walk Efficiency by Square Size") +
  scale_y_continuous(limits=c(0.14, 0.36),
                     breaks=c(0.15, 0.2, 0.25, 0.3, 0.35), 
                     labels = c("15%", "20%", "25%", "30%", "35%")) +
  geom_hline(aes(yintercept=0.33333), linetype="dotted")

for (s in 4:50){
  x <- 0:(2*s)
  y <- vector(mode="numeric", length=0)
  for (i in 0:(2*s)){
    y <- append(y, choose(2*s, i))
  }
  x <- x +2*s
  y <- y*(1/2)^(2*s)
  dat <- data.frame(x,y)
  pic<- ggplot(data=dat, aes(x=x, y=y)) +
    geom_bar(stat="identity", fill=I("lightblue"), col=I("black"), width = 1) +
    scale_x_continuous(breaks=c(2*s, 4*s)) + 
    xlab("Minutes") + ylab("Probability") + 
    theme(legend.position='none', title=bbi) +
    labs(title=paste("side length: ", s))
  pic
  ggsave(pic,filename=paste("dumb",s,".png",sep=""))
}

prob <- function(side, x){
  n <- 0:(side-x)
  print(sum(choose((side-1+n),n)*choose((side-n), x)))
}


for (s in 4:50){
  x <- 0:s
  y <- vector(mode="numeric", length=0)
  for (i in 0:s){
    y <- append(y, prob(s, i))
  }
  x <- x +2*s
  y[1] <- y[1]/2
  y <- y/(2^(2*s-1))
  dat <- data.frame(x,y)
  pic<- ggplot(data=dat, aes(x=x, y=y)) +
    geom_bar(stat="identity", fill=I("lightblue"), col=I("black"), width = 1) +
    scale_x_continuous(breaks=c(2*s, 3*s)) + 
    xlab("Minutes") + ylab("Probability") + 
    theme(legend.position='none', title=bbi) +
    labs(title=paste("side length: ", s))
  ggsave(pic,filename=paste("smart",s,".png",sep=""))
}