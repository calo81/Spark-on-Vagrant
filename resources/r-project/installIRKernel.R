
# Install IRKernel for iPython
install.packages("devtools", repo="http://stat.ethz.ch/CRAN/", dependencies=TRUE)
library(devtools)
install.packages(c('RCurl', 'rzmq','repr','IRkernel','IRdisplay'), repos = c('http://irkernel.github.io/', 'http://stat.ethz.ch/CRAN'))
