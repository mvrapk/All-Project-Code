## Analysis of the skull data discussed here: https://www.youtube.com/watch?v=48cZ2cMBpio

library(heplots)
data(Skulls)
names(Skulls)

##Dependent variables:
#mb = maximal breadth of the skull.
#bh = basibregmatic height of the skull.
#bl = basialveolar length of the skull.
#nh = nasal height of the skull.

## The first analysis:
skull.manova1 = manova(cbind(mb, bh, bl, nh) ~ epoch, data=Skulls)
summary(skull.manova1)

## Different MANOVA tests. (Recommendation: Wilks because it is the likelihood ratio test)
summary(skull.manova1, test = "Hotelling-Lawley")
summary(skull.manova1, test = "Roy")
summary(skull.manova1, test = "Pillai")
summary(skull.manova1, test = "Wilks")

## Univariate ANOVA summaries
summary.aov(skull.manova1)

## Pairwise MANOVA tests
skull.manova2 = manova(cbind(mb, bh, bl, nh) ~ epoch, data=Skulls, 
                             subset = epoch %in% c('c4000BC', 'c200BC') )


## A scientific discovery-based approach: Where are the differences, and are they significant?

attach(Skulls)

   windows()
   boxplot(mb ~ epoch, data=Skulls, ylab="mb")
   pairwise.t.test(mb, epoch, p.adj = "BH")

   windows()
   boxplot(bh ~ epoch, data=Skulls, ylab="bh")
   pairwise.t.test(bh, epoch, p.adj = "BH")

   windows()
   boxplot(bl ~ epoch, data=Skulls, ylab="bl")
   pairwise.t.test(bl, epoch, p.adj = "BH")

   windows()
   boxplot(nh ~ epoch, data=Skulls, ylab="nh")
   pairwise.t.test(nh, epoch, p.adj = "BH")
