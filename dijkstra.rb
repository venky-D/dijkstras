class GetDistance

  def initialize
    @vertix = 6
    @max = 1000
  end

  def min_distance(dist, spt_set)
    min_index = @max
    min = @max
    (0...@vertix).each do |v|
      if spt_set[v] == false and dist[v] <= min
        min = dist[v]
        min_index = v
      end
    end
    return min_index
  end

  def print_solution(dist, n)
    puts "Vertex   Distance from Source\n"
    (0...@vertix).each do |i|
      puts "#{i+1}, #{dist[i]}"
    end
  end

  def dijkstra(graph, src)
    dist = []
    spt_set = []
    (0...@vertix).each do |i|
      dist[i] = @max
      spt_set[i] = false
    end
    dist[src] = 0
    (0...@vertix-1).each do |count|
      u = min_distance(dist, spt_set)
      spt_set[u] = true
      (0...@vertix).each do |v|
        if !spt_set[v] and graph[u][v]!=0 and dist[u] != @max and dist[u]+graph[u][v] < dist[v]
          dist[v] = dist[u] + graph[u][v]
        end
      end
    end
    print_solution(dist, @vertix)
  end

end

class Dijkstra
  graph = [[0, 7, 9, 0, 0, 14],
           [7, 0, 10, 15, 0, 0],
           [9, 10, 0, 11, 0, 2],
           [0, 15, 11, 0, 6, 0],
           [0, 0, 0, 6, 0, 9],
           [14, 0, 2, 0, 9, 0]]


  obj=GetDistance.new
  obj.dijkstra(graph, 0)
end

