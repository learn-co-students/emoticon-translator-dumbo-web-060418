# require modules here
require 'pry'
require 'yaml'

def load_library(file_path)
  em_hash  = {"get_meaning" => {}, "get_emoticon" => {} }
  YAML.load_file(file_path).each do |k, v|
    japanese_emoticon = v[1]
    english_emoticon = v[0]
    em_hash["get_meaning"][japanese_emoticon] = k
    em_hash["get_emoticon"][english_emoticon] = japanese_emoticon
  end
  em_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  #binding.pry
  translation = library["get_emoticon"][emoticon]
  #binding.pry

  if translation
    translation
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  translation = library["get_meaning"][emoticon]
  if translation
    translation
  else
    "Sorry, that emoticon was not found"
  end
end
