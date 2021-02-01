
(**
  Abstract type of graphs.
*)
type graph

(**
  Iterate over vertices and their successors list
*)
val iter : (int -> int list -> unit) -> graph -> unit

(**
  Get the sucessors of a given vertex
*)
val succ : graph -> int -> int list

(**
  Create a new graph based on a list of (oriented) edges
*)
val mk_graph : (int * int) list -> int list array

(**
  Return the number of vertices in a graph (in time O(1))
*)
val vertices : graph -> int

(**
  Perform a Depth-first-search traversal. [dfs g pre post] will execute [pre x]
  when [x] is first discovered and [post x] right after the last successor of [x] has
  been visited
*)
val dfs : graph -> (int -> unit) -> (int -> unit) -> unit

(**
  Perform a Depth-first-search traversal by following a given order
*)
val dfs_ordered : graph -> (int -> unit) -> (int -> unit) -> int list -> unit

(**
  Perform topoligical sort on a graph. Returns an ordered list of vertices
*)
val topo_sort : graph -> int list

(**
  Exception raised when a cycle is detected in a graph
*)
exception Cycle

(**
  Detect cycles in a graph
*)
val has_cycle : graph -> bool

(**
  Compute the transposed graph of a graph
*)
val transpose : graph -> int list array

(**
  Computes the strongly connected components of a graph
*)
val kosaraju : graph -> int list list