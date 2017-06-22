##Gabe Ryan
##Ceasar Cipher
##June 20, 2017
##Ruby


def ceasar_cipher(text,key)
  final_text = ""
  words = text.split("")
  words.each { |char|
      case char
      when "a".."z"
        ((char.ord+key)>?z.ord || (char.ord+key)<?a.ord) ? final_text += wrap(char,key) : final_text += (char.ord+key).chr
      when "A".."Z"
        ((char.ord+key)>?Z.ord || (char.ord+key)<?A.ord) ? final_text += wrap(char,key) : final_text += (char.ord+key).chr
      else
        final_text += char
      end
    }
  puts final_text
end

def wrap(char,key)
  if key > 0
    return (char.ord+key - 26).chr
  else
    return (char.ord+key + 26).chr
  end
end


def main
  puts "Welcome to Ceasar Cipher!"
  puts "Enter 'encode' or 'decode' to begin program"
  choice = gets.chomp.downcase

  case choice
  when "encode"
    puts "Enter phrase to encode:"
    text = gets.chomp
    puts "Enter a key to encode with:"
    key = gets.chomp
    ceasar_cipher(text,key.to_i)
  when "decode"
    puts "Enter phrase to encode:"
    text = gets.chomp
    puts "Enter a key to decode with:"
    key = gets.chomp
    ceasar_cipher(text,key.to_i)
  else
    puts "Error, please run again"
  end
end

main
