
case ARGV[0]
    when "generate", "g"
      p "I'm going to generate"
    when "destroy", "d"
      p "I'm going to destroy"
    when "new"
      p "I'm going to create react app !"
      system("npx create-react-app #{ARGV[1]} && cd #{ARGV[1]} && rm -r -f src/ && mkdir src")
      Dir.mkdir("routes / pages etc..")
    else
      p "You gave me #{ARGV[0]} why ?"
end

