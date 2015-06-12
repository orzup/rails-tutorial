class String
  def shuffle
    self.split('').shuffle.join
  end
end

p "hogefuga".shuffle
