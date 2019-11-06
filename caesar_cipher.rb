# DONE !
def caesar_cipher(str, shift)
  split = str.split(" ")
  final = []

  def shift_wrapped(char, shift_val)
    if char.ord + shift_val >122
      diff = (char.ord + shift_val) - 122
      return (96 + diff).chr
    else
      return (char.ord + shift_val).chr
    end
  end

  split.each do |word|
    final_word = ""
    word.chars.each do |char|
      if char.ord <=122 and char.ord >=97
        final_word +=shift_wrapped(char,shift)
      else
        if char.ord >= 65 && char.ord <= 90
          lower_val = (char.ord + 32).chr
          final_word += shift_wrapped(lower_val,shift).capitalize
        elsif char.ord > 122 || char.ord < 96
          final_word += char
        end
      end
    end
    final.push(final_word)
  end
  puts final.join(" ")
end
caesar_cipher("What a string!", 5)