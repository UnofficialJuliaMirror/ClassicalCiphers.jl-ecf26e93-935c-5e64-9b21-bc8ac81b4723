"""
Encrypts the given plaintext according to the Caesar cipher.
The key is given as an integer, being the offset of each character;
so encrypt_caesar("abc", 1) == "BCD".

Converts the input to uppercase.
"""
function encrypt_caesar(plaintext, key::Integer)
  # plaintext: string; key: integer offset, so k=1 sends "a" to "b"
  key = ((key-1) % 26) + 1
  keystr = join([collect(Char(97+key):'z'); collect('a':Char(97+key-1))])
  encrypt_monoalphabetic(plaintext, keystr)
end

"""
Decrypts the given plaintext according to the Caesar cipher.
The key is given as an integer, being the offset of each character;
so decrypt_caesar("abcd", 1) == "zabc".

Converts the input to lowercase.
"""
function decrypt_caesar(ciphertext, key::Integer)
  # ciphertext: string; key: integer offset, so k=1 decrypts "B" as "a"
  key = ((key-1) % 26) + 1
  lowercase(encrypt_caesar(ciphertext, 26-key))
end