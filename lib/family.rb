person1 = { last: "ほげ", first: "ふが夫" }
person2 = { last: "ほげ", first: "ふが子" }
person3 = { last: "ほげ", first: "ふが太郎" }

params = { father: person1, mother: person2, child: person3}
p params[:father][:first]
# => "ふが夫"
