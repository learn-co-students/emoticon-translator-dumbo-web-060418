# require modules here
require "pry"
require 'yaml'

def load_library(argument)
  emoticons = {}
  emoticon_library = YAML.load_file(argument)
  emoticons["get_emoticon"] = {}
  emoticons["get_meaning"] = {}
  emoticon_library.each do |emo, symbols|
  emoticons["get_meaning"][symbols[1]] = emo
  emoticons["get_emoticon"][symbols[0]] = symbols[1]
end
emoticons
end


def get_japanese_emoticon(path, emoticon)
library = load_library(path)
if library["get_emoticon"].keys.include?(emoticon) == false
  return "Sorry, that emoticon was not found"
else
library["get_emoticon"][emoticon]
end
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  if library["get_meaning"].keys.include?(emoticon) == false
    return "Sorry, that emoticon was not found"
  else
  library["get_meaning"][emoticon]
  end
end
