#!/usr/bin/env ruby
# encode: UTF-8

# The Caesar's Cipher. Shift letter defined times to encrypt strings.

def caesar_cipher(string, pos)
  ascii = string.chars.map(&:ord)

  encryptor = ascii.map do |a|
    case a
    when (65..90)
      a += pos
      a -= 26 if a > 90
      a
    when (97..122)
      a += pos
      a -= 26 if a > 122
      a
    else
      a
    end
  end.map(&:chr).join

  encryptor
end

