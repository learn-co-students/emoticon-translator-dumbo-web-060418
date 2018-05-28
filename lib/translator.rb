require "pry"

# require modules here
require "yaml"

def load_library(file)
 emoticons = YAML.load_file(file)

  translate = {
    'get_meaning' => {}, #keys are japanese emoticons
    'get_emoticon' => {}, #keys are english emoticons, point to j emo
  }

  emoticons.each do |means, symbol|
    translate['get_meaning'][symbol[1]] = means
    translate['get_emoticon'][symbol[0]] = symbol[1]
  end

  translate
end

def get_japanese_emoticon(file, emoticon) #english emoticon
    translate = load_library(file)
     #returns the Japanese equivalent of an English symbol
     translate['get_emoticon'].each do |eng, jap|
    if translate['get_emoticon'].keys.include?(emoticon)
      if eng == emoticon
        return jap
      end
    else
      return "Sorry, that emoticon was not found"
    end
  end
end #ends method

def get_english_meaning(file, emoticon)
  translate = load_library(file)
   #returns the english equivalent of an Japanese symbol
   translate['get_meaning'].each do |jap, eng|
  if translate['get_meaning'].keys.include?(emoticon)
    if jap == emoticon
      return eng 
    end
  else
    return "Sorry, that emoticon was not found"
  end
end
end
