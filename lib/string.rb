def string_shuffle str
  str.split('').shuffle.join
end

p string_shuffle("hogefuga")

class String
  def shuffle
    self.split('').shuffle.join
  end
end

p "hogefuga".shuffle
