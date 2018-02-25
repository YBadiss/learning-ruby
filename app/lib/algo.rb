def distance(word1, word2)
  d = Array.new(word1.length + 1) { Array.new(word2.length + 1, 0) }
  (0..word1.length).each { |i| d[i][0] = i }
  (0..word2.length).each { |j| d[0][j] = j }

  (0...word1.length).each do |i|
    (0...word2.length).each do |j|
      sub_cost = word1[i] == word2[j] ? 0 : 1
      d[i + 1][j + 1] = [d[i][j + 1] + 1, d[i + 1][j] + 1, d[i][j] + sub_cost].min
    end
  end

  return d[word1.length][word2.length]
end

def best_name(names, target_name)
  return names.map { |name| [distance(name, target_name), name] }.min.reverse
end