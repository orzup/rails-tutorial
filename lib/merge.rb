# http://ruby-doc.org/core-2.2.2/Hash.html#method-i-merge
# マージすると同じkeyのvalueは上書きされる
{ "a" => 100, "b" => 200 }.merge({ "b" => 300 })
# => { "a" => 100, "b" => 300 }
