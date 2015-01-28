describe "ROT13" do
  it "rien a convertir" do
  expect(rot13("")).to eq("")
  end
  
  it "convertir a en n" do
  expect(rot13("a")).to eq("n")
  end
  
  it "convertir hello en uryyb" do
  expect(rot13("dream")).to eq("qernz")
  end
  
  it "convertir hello en uryyb" do
  expect(rot13("living the dream")).to eq("yvivat gur qernz")
  end
end
  
def encrypt_decrypt(text)
  rot13(text)
end
  
private

def rot13(text)
  new_text = ""
  text.each_char do |letter|
    13.times {letter = letter.next[-1]} if ("A".."z").include? letter
    new_text << letter
  end
  new_text
end 



