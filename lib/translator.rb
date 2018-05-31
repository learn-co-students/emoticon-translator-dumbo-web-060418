require 'yaml'
 
 def load_library(file_path)

emoticons = YAML.load_file(file_path)

dictionary = {"get_meaning" => {}, "get_emoticon" => {}}

emoticons.each do |meaning, emoticon|
    dictionary["get_meaning"][emoticon[1]] = meaning
    dictionary["get_emoticon"][emoticon[0]] = emoticon[1]
    end
    dictionary
end
 
def get_japanese_emoticon(file_path, emoticon)
  dictionary = load_library(file_path)
  dictionary["get_emoticon"][emoticon] || "Sorry, that emoticon was not found"
 end
  
def get_english_meaning(file_path, emoticon)
  dictionary = load_library(file_path)
  dictionary["get_meaning"][emoticon] || "Sorry, that emoticon was not found"
end