##This function calculates the probability distribution of a graph. You can set change the mode of the edges to "out", 
#"in", "all".


library("igraph")

DG<-function(G,m){
  #We estimate the degree and degree distribution
  #Keep in mind: m=1 for mode "out", m=2 for mode "in", m=3 for mode "all".
  if(m==1){m="out"}
  if(m==2){m="in"}
  if(m==3){m="all"}
  d=degree(G,mode=m)
  dd=degree.distribution(G,mode=m,comulative=F)
  degree=1:max(d)
  probability=dd[-1]
  #Delete the non zero values
  nonzero.position=which(probability!=0)
  probability=probability[nonzero.position]
  degree=degree[nonzero.position]
  #Plot
  plot(probability, degree, log="xy",xlab="Degree (log)",ylab="Probability (log)",
       col=1,main="Degree distribution")
}
