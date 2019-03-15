# simple page rank calculator

# INPUT : Adjacency Matrix  (n by n square matrix)
# OUTPUT: Vector containing pagerank values.  (n rows)
function pagerank = pagerank (G, nIterations)
  
  if (rows(G) != columns(G))
    error("adjacency matrix must be a square matrix.");
  endif
  
  if (!exist("nIterations"))
    nIterations = 20;
  endif
  
  # n is the number of nodes (or webpages).
  n = rows(G);
  
  # initialize the pagerank vector.
  # The first node will be given a rank of 1.
  # The rest of the nodes will be given a rank of 0.
  pagerank = zeros(n, 1);
  pagerank(1,1) = 1;
  
  # The sum of a column is the number of outbound links for that node.
  # sum(G) returns a vector(1 by n) with each column's sum.
  # 1 ./ sum(G) returns a vector(1 by n) with 1/sum(col) in each value.
  # the whole expression returns the HYPERLINK MATRIX.
  # Note that in the HyperlinkMatrix: each column's sum is equal to 1.
  hyperlinkMatrix = (1 ./ sum(G))  .* G;
  
  # Pagerank main loop.
  for i = [1:nIterations];
    pagerank = hyperlinkMatrix * pagerank;
  endfor
  
  # Fun fact:  When you add up all the pageranks of each page, you get 1.
    
endfunction