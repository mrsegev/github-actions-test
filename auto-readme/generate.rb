require "yaml"
p Dir.pwd
p Dir["*"]
@template = File.read("#{Dir.pwd}/auto-readme/template.md")
valuesFile = YAML.load(File.read("#{Dir.pwd}/auto-readme/values.yml"))
@values = {}
valuesFile.each { | key, value |
    @values[key.to_sym] = value
}

pattern = /{{(.*?)}}/
placeholders = []

@template.each_line do |line|
    if line =~ pattern
        placeholders.push(line.slice! pattern)
    end
end

finalText = @template.clone
placeholders.each do |placeholder|
    key =  placeholder.tr('{{}}', '').to_sym
    finalText = finalText.sub(placeholder, @values[key])
end

puts finalText
File.open("#{Dir.pwd}/auto-readme/README.md", "w") { |f| f.write(finalText) }








# if (File.file?("README.md"))
#     File.write("README.md", finalText)
# end
# toReplace = @template.find_all(/{(.*?)}/)
# puts toReplace[1].class

# toReplace.each do |string|
#     string2 = "{#{string[0]}}"
#     puts string2
#     content = @template.sub(string2, @config[:string[0]])
#     puts content
# end
# newContent = @template.sub(/{title}/, "hi")
# puts newContent

# @template.each_line do |line|
#     puts line
# end
